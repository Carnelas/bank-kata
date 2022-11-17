defmodule Account.Repo do
  @type operations :: list()

  def addDeposit(amount) do
    operationList = fetchOperations()
    balance = getBalance(operationList) + amount

    newOperation = operationList ++ [{amount, balance}]
    # IO.puts(operationList)
    :ets.insert(:operations, {"list", newOperation})
  end

  def fetchOperations() do
    operationExists = :ets.whereis(:operations)
    [{_, operationList}] = getOperations(operationExists)
    operationList
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
