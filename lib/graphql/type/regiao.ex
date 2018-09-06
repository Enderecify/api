defmodule EnderecifyApi.Graphql.Type.Regiao do
  use EnderecifyApi, :graphql_schema

  object :regiao do
    field(:nome, :string)
    field(:sigla, :string)
    field(:estados, list_of(:estado), resolve: assoc(:estados, fn(query, _args, _ctx) ->
      query |> order_by(:nome)
    end))
  end
end
