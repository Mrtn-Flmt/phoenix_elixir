defmodule HelloWeb.UserController do
  use HelloWeb, :controller
  alias Hello.Repo

  def show(conn, %{"pid" => pid}) do
    user = Repo.get(Hello.User, pid)

    case user do
      nil ->
        conn
        |> put_status(:not_found)
        |> text("Utilisateur non trouvé")

      user ->
        conn
        |> put_status(:ok)
        |> text("User PID: #{user.pid}, Name: #{user.name}")
    end
  end
end
