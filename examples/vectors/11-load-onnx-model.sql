-- @setup begin dbms_vector.drop_onnx_model(model_name => 'ALL_MINILM_L12_V2', force => true); exception when others then null; end;
begin
  dbms_vector.load_onnx_model(
    directory  => 'NIMBUS_FILES',
    file_name  => 'all_MiniLM_L12_v2.onnx',
    model_name => 'ALL_MINILM_L12_V2',
    metadata   => json('{"function": "embedding", "embeddingOutput": "embedding",
                         "input": {"input": ["DATA"]}}'));
end;
/
select model_name, mining_function, algorithm
from   user_mining_models
where  model_name = 'ALL_MINILM_L12_V2';
