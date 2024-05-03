defmodule RentajWeb.Services.Authorization.Account do
  import Bcrypt, only: [verify_pass: 2, no_user_verify: 0]
  alias RentajWeb.Services
  alias Rentaj.Repo
  alias Services.Token.Token
  alias Services.Token.Signer

  # alias Rentaj.Users.User

  def execute(email, username, password) do
    with true <- validate_params(email, username, password),
         account when not is_nil(account) <-
           Repo.get_by(Account, generate_params(email, username)),
         true <- check_password(password, account),
         {:ok, token, _claims} =
           Token.generate_and_sign(
             %{account_id: account.id},
             Signer.generate()
           ) do
      {:ok, %{token: token, account: nil}}
    else
      response ->
        case response do
          false -> {:error, "Invalid credentials!"}
          nil -> {:error, "Account not found!"}
          response -> response
        end
    end
  end

  defp validate_params(nil, _username, _password), do: true
  defp validate_params(_email, nil, _password), do: true
  defp validate_params(_, _, nil), do: {:error, "Password must be provided!!"}

  defp validate_params(_email, _username, _),
    do: {:error, "Cannot provide both email and username!"}

  defp generate_params(nil, username), do: %{username: username}
  defp generate_params(email, nil), do: %{email: email}

  defp check_password(_password, nil), do: no_user_verify()
  defp check_password(password, account), do: verify_pass(password, account.password_digest)
end
