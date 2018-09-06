defmodule EnderecifyApi.Plug do
  @behaviour Plug
  import Plug.Conn
  require Logger

  def init(options) do
    build_config(options)
  end

  def call(conn, config) do
    Absinthe.Plug.call(conn, config)
  end

  defp build_config(config) do
    config
    |> Map.merge(%{
      schema: EnderecifyApi.GraphqlSchema,
      json_codec: Jason
    })
  end
end
