defmodule EnderecifyApi.Schema.LogradouroSearch do
  use EnderecifyApi, :schema
  alias EnderecifyApi.Schema.{Localidade, Estado}

  schema "logradouros_search" do
    belongs_to(:localidade, Localidade)
    belongs_to(:estado, Estado, foreign_key: :sigla_estado, references: :sigla, type: :string)
    field(:endereco, :string)
    field(:readings, {:array, :string})
    field(:table_name, :string)
    field(:record_id, :integer)
  end
end
