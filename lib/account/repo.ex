defmodule Account.Repo do
  alias __MODULE__.Adapter

  def addDeposit(amount) do
    Adapter.buildNewOperation(amount)
    |> Adapter.insert()
  end

  def fetchOperations() do
    Adapter.fetchOperations()
  end
end
