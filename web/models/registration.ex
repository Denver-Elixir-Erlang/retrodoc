defmodule Retrodoc.Registration do
  import Ecto.Changeset, only: [put_change: 3]

  def create(changeset, repo) do
    put_change(changeset, :crypted_password, hashed_password(changeset.params["password"]))
    |> repo.insert()
  end

  defp hashed_password(password) do
    # hash password
    Comeonin.Bcrypt.hashpwsalt(password)
  end
end
