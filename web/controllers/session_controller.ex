defmodule Chatter.SessionController do
	use Chatter.Web, :controller
	import Chatter.Auth

	def new(conn, _params) do
		render(conn, "new.html")
	end

	def create(conn, %{"session" => %{"email" => user, "password" => password}}) do
		case login_with(conn, user, password, repo: Repo) do
		   {:ok, conn} ->
		   		logger_user = Guardian.Plug.current_resource(conn)
		   		conn
		   		|> put_flash(:info, "Iniciaste Sesion")
		   		|> redirect(to: page_path(conn, :index))
		   {:error, _reason, conn} ->
		   		conn
		   		|> put_flash(:error, "La Contraseña o Usuario estan mal")
		   		|> render("new.html")
		end
	end

	def delete(conn, _) do
	  	conn
	  	|> Guardian.Plug.sign_out
	  	|> redirect(to: "/")
  	end
end