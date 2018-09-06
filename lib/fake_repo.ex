defmodule Enderecify.FakeRepo do
  @moduledoc """
  Upon publishing the package,`use Absinthe.Ecto, repo: MyApp.Repo` expects
  an existing Repo module, otherwise it fails.

  ```
  ** (RuntimeError) You mustuse Absinthe.Ecto, repo: MyApp.Repowith your application's repo..
  ```

  This is a fake repo so that we're able to publish the package, but never meant to be actually used.

  A real Repo must be given using the config:

  ```ex
  config :enderecify_api,
    repo: MyApp.Repo
  ```
  """
  use Ecto.Repo,
    otp_app: :enderecify_api,
    adapter: Ecto.Adapters.Postgres
end
