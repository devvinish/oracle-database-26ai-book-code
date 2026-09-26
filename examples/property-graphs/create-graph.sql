-- @setup drop property graph if exists nimbus_network
create property graph nimbus_network
  vertex tables (
    airports key (airport_code)
      label airport properties (airport_code, city, country_code, is_hub)
  )
  edge tables (
    routes key (route_id)
      source key (origin) references airports (airport_code)
      destination key (destination) references airports (airport_code)
      label route properties (distance_km, block_minutes)
  );

select graph_name, graph_mode from user_property_graphs;
