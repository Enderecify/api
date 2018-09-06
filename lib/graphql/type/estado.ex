defmodule EnderecifyApi.Graphql.Type.Estado do
  use EnderecifyApi, :graphql_schema

  object :estado do
    field(:nome, :string)
    field(:sigla, :string)
    field(:regiao, :regiao, resolve: assoc(:regiao))
  end
end
