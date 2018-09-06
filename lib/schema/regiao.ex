defmodule EnderecifyApi.Schema.Regiao do
  use EnderecifyApi, :schema
  alias EnderecifyApi.Schema.{Estado, Regiao}

  @primary_key {:sigla, :string, []}

  schema "regioes" do
    has_many(:estados, Estado, foreign_key: :sigla_regiao)
    field(:nome, :string)
  end

  @doc false
  def new(attrs) do
    %Regiao{}
    |> cast(attrs, [:sigla, :nome])
  end
end
