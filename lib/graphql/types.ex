defmodule EnderecifyApi.Graphql.Types do
  use Absinthe.Schema.Notation

  import_types(EnderecifyApi.Graphql.Type.Regiao)
  import_types(EnderecifyApi.Graphql.Type.Estado)
  import_types(EnderecifyApi.Graphql.Type.Localidade)
  import_types(EnderecifyApi.Graphql.Type.Bairro)
  import_types(EnderecifyApi.Graphql.Type.Logradouro)
end
