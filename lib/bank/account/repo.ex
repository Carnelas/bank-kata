defmodule Bank.Account.Repo do
  @moduledoc false

  def addDeposit(amount),
    do: adapter().addDeposit(amount)

  defp adapter, do: Application.get_env(:bank, :account)[:adapter]
end
