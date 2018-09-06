defmodule EnderecifyApi.Schema.Localidade do
  use EnderecifyApi, :schema
  alias EnderecifyApi.Schema.{Estado, Localidade, Bairro}

  schema "localidades" do
    has_many(:bairros, Bairro)
    belongs_to(:estado, Estado, foreign_key: :sigla_estado, references: :sigla, type: :string)
    field :nome, :string
    field :cep, :string
    field :situacao, :string
    field :tipo, :string
    field :abbr, :string
    field :ibge_municipio_id, :string
  end

  @doc false
  def new(attrs) do
    %Localidade{}
    |> cast(attrs, [
      :id, :sigla_estado, :nome, :cep, :situacao,
      :tipo, :abbr, :ibge_municipio_id
    ])
  end
end
