defmodule EnderecifyApi.Graphql.Type.Logradouro do
  use EnderecifyApi, :graphql_schema

  object :logradouro do
    field(:estado, :estado, resolve: assoc(:estado))
    field(:localidade, :localidade, resolve: assoc(:localidade))
    field(:bairro, :bairro, resolve: assoc(:bairro))
    field(:nome, :string, resolve: &EnderecifyApi.Resolver.Logradouro.formatted_nome/3)
    field(:complemento, :string)
    field(:cep, :string)
    field(:abbr, :string)

    field(:formatted_cep, :string, resolve: &EnderecifyApi.Resolver.Logradouro.formatted_cep/3)
    field(:linha1, :string, resolve: &EnderecifyApi.Resolver.Logradouro.linha1/3)
    field(:linha2, :string, resolve: &EnderecifyApi.Resolver.Logradouro.linha2/3)
  end
end
