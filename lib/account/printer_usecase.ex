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

  defp printRow({amount, balance}) do
    date = get_date()
    String.trim("#{date} || #{amount} || #{balance}") |> IO.puts()
  end

  defp get_date() do
    DateTime.to_date(DateTime.utc_now()) |> to_string()
  end
end
