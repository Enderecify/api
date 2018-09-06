defmodule EnderecifyApi.Resolver.Localidade do
  use EnderecifyApi, :graphql_resolver
  alias EnderecifyApi.Schema.Localidade

  def handle(%{sigla_estado: sigla_estado}, _) do
    {
      :ok,
      with_estado(sigla_estado) |> by_nome() |> repo().all()
    }
  end

  defp with_estado(query \\ from(e in Localidade), sigla_estado) do
    query
    |> where(sigla_estado: ^sigla_estado)
  end

  defp by_nome(query) do
    query
    |> order_by(:nome)
  end
end
