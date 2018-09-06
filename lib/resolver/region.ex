defmodule EnderecifyApi.Resolver.Regiao do
  use EnderecifyApi, :graphql_resolver
  alias EnderecifyApi.Schema.Regiao

  def handle(_, _) do
    {
      :ok,
      by_nome() |> repo().all()
    }
  end

  defp by_nome(query \\ Regiao) do
    query
    |> order_by(:nome)
  end
end
