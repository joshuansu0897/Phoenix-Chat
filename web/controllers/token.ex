defmodule Chatter.Token do
	user Chatter.Web, :controller

	def unAuthenticated(conn, _params) do
		conn
		|> put_flash(:error, "Tienes que iniciar sesion")
		|> redirect(to: session_path(conn, :new))
	end

	def unAuthorized(conn, _params) do
		conn
		|> put_flash(:error, "Tienes que iniciar sesion")
		|> redirect(to: session_path(conn, :new))
	end
end