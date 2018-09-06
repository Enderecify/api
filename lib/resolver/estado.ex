defmodule EnderecifyApi.Resolver.Estado do
  use EnderecifyApi, :graphql_resolver
  alias EnderecifyApi.Schema.Estado

  def handle(%{sigla_regiao: sigla_regiao}, _) do
    {
      :ok,
      with_region(sigla_regiao) |> by_nome() |> repo().all()
    }
  end

  def handle(_, _) do
    {
      :ok,
      by_nome() |> repo().all()
    }
  end

  defp with_region(query \\ from(e in Estado), sigla_regiao) do
    query
    |> where(sigla_regiao: ^sigla_regiao)
  end

  defp by_nome(query \\ Estado) do
    query
    |> order_by(:nome)
  end
end
