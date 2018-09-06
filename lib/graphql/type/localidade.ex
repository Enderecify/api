defmodule EnderecifyApi.Graphql.Type.Localidade do
  use EnderecifyApi, :graphql_schema

  object :localidade do
    field(:id, :id)
    field(:nome, :string)
    field(:abbr, :string, description: "Abreviação. Ex: Santa Fé - Sta Fé, Vila Flor - Vl Flor")
    field(:ibge_municipio_id, :string, description: "ID do município na API do IBGE. Ex: 1200351 - https://servicodados.ibge.gov.br/api/v1/localidades/municipios/1200351")
  end
end
