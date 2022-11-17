defmodule Account do
  @moduledoc """
  Keeps the contexts that define the account
  """

  @spec addDeposit(non_neg_integer()) :: :ok
  def addDeposit(amount) do
    Account.Repo.addDeposit(amount)
  end

  def printStatement() do
    IO.puts("Date || Amount || Balance")

    list = Account.Repo.fetchOperations()
    Enum.each(list, fn row -> printRow(row) end)
  end

  defp printRow({amount, balance}) do
    String.trim("_ || #{amount} || #{balance}") |> IO.puts()
  end
end
