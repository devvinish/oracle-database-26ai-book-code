-- @setup drop table if exists airport_points purge
create table airport_points as
select airport_code,
       to_vector('[' || round(cos(lat) * cos(lon), 6) || ','
                     || round(cos(lat) * sin(lon), 6) || ','
                     || round(sin(lat), 6) || ']', 3, float32) as position
from   (select airport_code, latitude * acos(-1) / 180 as lat,
               longitude * acos(-1) / 180 as lon
        from   airports);

begin
  dbms_vector.create_index(
    idx_name            => 'AIRPORT_POINTS_IVF',
    table_name          => 'AIRPORT_POINTS',
    idx_vector_col      => 'POSITION',
    idx_organization    => 'NEIGHBOR PARTITIONS',          -- IVF
    idx_partitioning_scheme => 'GLOBAL',             -- the table is not partitioned
    idx_distance_metric => 'COSINE',
    idx_accuracy        => 90,
    idx_parameters      => '{"type":"IVF", "partitions":4}');
end;
/
select index_name, index_type, index_subtype from user_indexes
where  table_name = 'AIRPORT_POINTS' and index_type = 'VECTOR';

select dbms_vector.index_accuracy_query(
         owner_name      => user,
         index_name      => 'AIRPORT_POINTS_IVF',
         qv              => (select position from airport_points
                             where  airport_code = 'DXB'),
         top_k           => 5,
         target_accuracy => 90) as report
from   dual;

-- probe all 4 partitions instead of the default
select dbms_vector.index_accuracy_query(
         owner_name  => user,
         index_name  => 'AIRPORT_POINTS_IVF',
         qv          => (select position from airport_points
                         where  airport_code = 'DXB'),
         top_k       => 5,
         query_param => json('{"neighbor partition probes": 4}')) as report
from   dual;
-- @cleanup drop table if exists airport_points purge
