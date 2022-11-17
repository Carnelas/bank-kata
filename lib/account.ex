defmodule Account do
  @moduledoc """
  Keeps the contexts that define the account
  """

  @spec addDeposit(non_neg_integer()) :: :ok
  def addDeposit(amount) do
    response = Account.Repo.addDeposit(amount)

  end

  def printStatement() do
    IO.puts("Date || Amount || Balance")
  end
end
