defmodule EnderecifyApi.Resolver.Logradouro do
  use EnderecifyApi, :graphql_resolver
  alias EnderecifyApi.Schema.{Logradouro, LogradouroSearch}

  def handle(%{cep: cep}, _) do
    {
      :ok,
      with_cep(cep) |> by_nome() |> repo().all()
    }
  end

  def handle(%{busca: nil}, _), do: {:error, "Especifique uma busca"}

  def handle(%{busca: ""}, _), do: {:error, "Especifique uma busca"}

  def handle(%{busca: busca} = params, _) do
    {
      :ok,
      normalize_address(busca)
      |> matching_address()
      |> with_localidade(params[:localidade_id])
      |> all_logradouros_from_search()
    }
  end

  def handle(_, _), do: {:error, "Especifique uma busca"}

  # return Ex: Rua Nome Da Rua, Centro
  def linha1(logradouro, _args, _ctx) do
    bairro = bairro(logradouro).nome
    street_name = [logradouro.tipo, logradouro.nome] |> join_address(" ")

    {
      :ok,
      [street_name, bairro]
      |> join_address()
    }
  end

  # return Ex: 45678-910, Cidade, Estado
  def linha2(logradouro, _args, _ctx) do
    localidade = localidade(logradouro)

    {
      :ok,
      [formatted_cep(logradouro.cep), localidade.nome, localidade.sigla_estado]
      |> join_address()
    }
  end

  def formatted_nome(%{tipo: tipo, nome: nome}, _args, _ctx) do
    {:ok, "#{tipo} #{nome}"}
  end

  def formatted_cep(logradouro, _args, _ctx) do
    {:ok, formatted_cep(logradouro.cep)}
  end

  defp formatted_cep(cep) do
    cep
    |> String.graphemes()
    |> List.insert_at(5, "-")
    |> Enum.join()
  end

  defp with_cep(query \\ Logradouro, cep) do
    digits = cep |> String.replace(~r/[^\d]/, "")

    query
    |> where(cep: ^digits)
    |> limit(6)
  end

  defp with_localidade(query, localidade_id) do
    case localidade_id do
      nil -> query
      _ -> query |> where(localidade_id: ^localidade_id)
    end
  end

  defp matching_address(text) do
    LogradouroSearch
    |> where(fragment("readings &^ ?", ^text))
    |> order_by(fragment("pgroonga_score(tableoid, ctid) DESC"))
  end

  defp all_logradouros_with_ids(logradouros_ids) do
    from(l0 in Logradouro, where: l0.id in ^logradouros_ids)
    |> repo().all()
  end

  defp all_logradouros_from_search(query) do
    query
    |> limit(6)
    |> repo().all()
    |> Enum.map(&Map.get(&1, :record_id))
    |> all_logradouros_with_ids()
  end

  defp by_nome(query) do
    query
    |> order_by(:nome)
  end

  defp bairro(logradouro) do
    repo().preload(logradouro, :bairro).bairro
  end

  defp localidade(logradouro) do
    repo().preload(logradouro, :localidade).localidade
  end

  defp join_address(array, join_with \\ ", ") do
    array
    |> Enum.reject(&is_nil(&1))
    |> Enum.join(join_with)
  end

  def normalize_address(string) do
    string
    |> String.downcase()
    |> String.normalize(:nfd)
    |> String.replace(~r/[^A-Za-z\s\d]/u, "")
  end
end
