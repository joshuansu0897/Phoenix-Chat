defmodule Chatter.Token do
	use Chatter.Web, :controller

	def unauthenticated(conn, _params) do
		conn
		|> put_flash(:error, "Tienes que iniciar sesion")
		|> redirect(to: session_path(conn, :new))
	end

	def unauthorized(conn, _params) do
		conn
		|> put_flash(:error, "Tienes que iniciar sesion")
		|> redirect(to: session_path(conn, :new))
	end
end