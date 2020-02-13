defmodule BigGate.Core.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "core_users" do

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
