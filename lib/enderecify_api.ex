defmodule EnderecifyApi do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use EnderecifyApi, :controller
      use EnderecifyApi, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
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

      def repo do
        Application.get_env(:enderecify_api, :repo, Enderecify.Repo)
      end
    end
  end

  def graphql_schema do
    quote do
      use Absinthe.Schema.Notation
      use Absinthe.Ecto, repo: Application.get_env(:enderecify_api, :repo)
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
