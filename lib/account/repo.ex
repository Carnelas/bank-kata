defmodule Account.Repo do
  alias __MODULE__.Adapter

  def addDeposit(date, amount) do
    Adapter.buildNewOperation(date, amount)
    |> Adapter.insert()
  end

  def withdrawDeposit(date, amount) do
    Adapter.buildNewOperation(date, amount)
    |> Adapter.insert()
  end

  def fetchOperations() do
    Adapter.fetchOperations()
  end
end
