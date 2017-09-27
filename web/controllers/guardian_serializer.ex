defmodule Chatter.GuardianSerializer do
	@behaviour Guardian.Serializer

	alias Chatter.Repo
	alias Chatter.User

	def for_token(user = %User{}), do: {:ok, "Usuario:#{user.id}"}
	def for_token(_), do: {:error, "Error, campo vacio o algo mas sarra"}

	def from_token("Usuario:" <> id), do: {:ok, Repo.get(User, id)}
	def from_token(_), do: {:error, "Error, campo vacio o algo mas sarra"}

end