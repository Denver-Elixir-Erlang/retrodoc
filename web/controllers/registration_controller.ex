defmodule Retrodoc.RegistrationController do
  use Retrodoc.Web, :controller
  alias Retrodoc.User
  require IEx

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
      IEx.pry

    case Retrodoc.Registration.create(changeset, Retrodoc.Repo) do
      # sign in the user
      {:ok, _user} ->
      conn
      |> put_flash(:info, "Your account was created")
      #|> redirect(to: page_path(conn, :index))
      |> redirect(to: "/")

      # show error message
      {:error, changeset} ->
      IEx.pry
      #|> put_flash(:info, "Unable to register user")
      render(conn, "new.html", changeset: changeset)
    end
  end

end
