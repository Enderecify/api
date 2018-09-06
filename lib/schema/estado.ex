defmodule EnderecifyApi.Schema.Estado do
  use EnderecifyApi, :schema
  alias EnderecifyApi.Schema.{Regiao, Localidade, Estado}

  @primary_key {:sigla, :string, []}

  schema "estados" do
    has_many(:cidades, Localidade, foreign_key: :sigla_estado)
    belongs_to(:regiao, Regiao, foreign_key: :sigla_regiao, references: :sigla, type: :string)
    field(:nome, :string)
  end

  @doc false
  def new(attrs) do
    %Estado{}
    |> cast(attrs, [:sigla, :nome, :sigla_regiao])
  end
end
