defmodule Retrodoc.RegistrationController do
  use Retrodoc.Web, :controller
  alias Retrodoc.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Retrodoc.Registration.create(changeset, Retrodoc.Repo) do
      {:ok, changeset} ->
        # sign in the user
      {:error, changeset} ->
        # show error message
    end
  end

end
