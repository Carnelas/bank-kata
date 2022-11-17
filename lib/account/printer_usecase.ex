defmodule Account.PrinterUsecase do
  alias Account.Repo

  def printStatement() do
    buildTitle() |> IO.puts()

    Repo.fetchOperations()
    |> Enum.reverse()
    |> Enum.each(fn row -> printRow(row) end)
  end

  defp buildTitle() do
    "Date || Amount || Balance"
  end

  defp printRow({date, amount, balance}) do
    String.trim("#{date} || #{amount} || #{balance}") |> IO.puts()
  end
end
