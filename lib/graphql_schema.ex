defmodule EnderecifyApi.GraphqlSchema do
  use Absinthe.Schema

  import_types(EnderecifyApi.Graphql.Types)

  query do
    field :regioes, list_of(:regiao), description: "Lista de regiões" do
      resolve(&EnderecifyApi.Resolver.Regiao.handle/2)
    end

    field :estados, list_of(:estado), description: "Lista de estados. Passe siglaEstado para pegar apenas estados de uma região." do
      arg(:sigla_regiao, :string, description: "Sigla de uma região. Ex: SE, S, NE")
      resolve(&EnderecifyApi.Resolver.Estado.handle/2)
    end

    field :localidades, list_of(:localidade), description: "Lista cidades de um estado" do
      arg(:sigla_estado, non_null(:string), description: "UF de um estado. Ex: RS, MA, RJ, SP")
      resolve(&EnderecifyApi.Resolver.Localidade.handle/2)
    end

    field :bairros, list_of(:bairro), description: "Lista os bairros uma cidade" do
      arg(:localidade_id, non_null(:id), description: "ID de uma localidade")
      resolve(&EnderecifyApi.Resolver.Bairro.handle/2)
    end

    field :logradouros, list_of(:logradouro), description: "Busca logradouros tanto por CEP quanto por um texto. É possível delimitar a busca por cidade." do
      arg(:cep, :string, description: "Pode enviar em qualquer formato, caracteres não numéricas são removidos. Ex: '12345-123', '12345123', '1-2.3.4_512=3")
      arg(:busca, :string, description: "Auto completa logradouros do Brasil. Ex: av paulista sao paulo sp")
      arg(:localidade_id, :id, description: "Delimita a busca por cidade. Ex: 9668")
      resolve(&EnderecifyApi.Resolver.Logradouro.handle/2)
    end
  end
end
