defmodule Account.Repo.Adapter do
  def buildNewOperation(amount) do
    operationList = fetchOperations()
    balance = getBalance(operationList) + amount

    operationList ++ [{amount, balance}]
  end

  def fetchOperations() do
    operationExists = :ets.whereis(:operations)
    [{_, operationList}] = getOperations(operationExists)
    operationList
  end

  def insert(newOperation) do
    :ets.insert(:operations, {"list", newOperation})
  end

  defp getOperations(exists) when exists == :undefined do
    createTable()
    :ets.lookup(:operations, "list")
  end

  defp getOperations(_exist) do
    :ets.lookup(:operations, "list")
  end

  defp getBalance(list) do
    case list do
      [] ->
        0

      list ->
        {_amount, balance} = List.last(list)
        balance
    end
  end

  defp createTable() do
    :ets.new(:operations, [:set, :named_table])
    :ets.insert(:operations, {"list", []})
  end
end
