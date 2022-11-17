defmodule Account.Repo.Adapter.MockedDb do
  def insert(newOperation) do
    :ets.insert(:operations, {"list", newOperation})
  end

  def operationsListExist() do
    :ets.whereis(:operations)
  end

  def createTable() do
    :ets.new(:operations, [:set, :named_table])
    :ets.insert(:operations, {"list", []})
  end

  def searchOperationsList() do
    :ets.lookup(:operations, "list")
  end
end
