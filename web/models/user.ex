defmodule Retrodoc.User do
  use Retrodoc.Web, :model
   @required_fields ~w(email password)
   @optional_fields ~w()

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/[\w\d%+-]+@[\w\d.-]+\.[\w]{2,4}/)
    |> validate_length(:password, min: 5)
  end
end
