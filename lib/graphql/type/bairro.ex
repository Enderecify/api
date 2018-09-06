defmodule EnderecifyApi.Graphql.Type.Bairro do
  use EnderecifyApi, :graphql_schema

  object :bairro do
    field(:id, :id)
    field(:nome, :string)
    field(:abbr, :string)
    field(:localidade, :localidade, resolve: assoc(:localidade))
  end
end
