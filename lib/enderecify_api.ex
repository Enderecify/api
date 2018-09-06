defmodule EnderecifyApi do
  @moduledoc """
  This is the API used at enderecify.com, it's open source so that others can colaborate,
  but it's probably not useful for anything else.
  """

  def schema do
    quote do
      use Ecto.Schema
      import Ecto.Changeset
    end
  end

  def graphql_resolver do
    quote do
      import Ecto.Query, warn: false
      import Ecto

      def repo, do: Application.get_env(:enderecify_api, :repo)
    end
  end

  def graphql_schema do
    quote do
      use Absinthe.Schema.Notation
      use Absinthe.Ecto,
        repo: Application.get_env(:enderecify_api, :repo, Enderecify.FakeRepo)
      import Ecto.Query, warn: false
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
