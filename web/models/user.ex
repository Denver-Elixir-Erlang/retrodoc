defmodule Retrodoc.User do
  use Retrodoc.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/[\w\d%+-]+@[\w\d.-]+\.[\w]{2,4}/)
    |> validate_length(:password, min: 5)
  end
end
