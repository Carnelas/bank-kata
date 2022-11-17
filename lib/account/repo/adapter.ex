defmodule Account.Repo.Adapter do
  alias __MODULE__.MockedDb

  def buildNewOperation(amount) do
    operationsList = fetchOperations()
    balance = getBalance(operationsList) + amount

    operationsList ++ [{amount, balance}]
  end

  def fetchOperations() do
    MockedDb.operationsListExist()
    |> getOperations()
  end

  def insert(newOperation) do
    MockedDb.insert(newOperation)
  end

  defp getOperations(exists) when exists == :undefined do
    MockedDb.createTable()
    [{_, operationsList}] = MockedDb.searchOperationsList()
    operationsList
  end

  defp getOperations(_exist) do
    [{_, operationsList}] = MockedDb.searchOperationsList()
    operationsList
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
end

# ToDo
# defp adapter, do: Application.get_env(:account, :acount)[:database]
# every function will do something like database().new(amount)
