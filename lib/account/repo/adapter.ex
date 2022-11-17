defmodule Account.Repo.Adapter do
  alias __MODULE__.MockedDb

  def buildNewOperation(date, amount) do
    operationsList = fetchOperations()
    balance = getBalance(operationsList) + amount
    operationsList ++ [{date, amount, balance}]
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
    MockedDb.searchOperationsList()
  end

  defp getOperations(_exist) do
    MockedDb.searchOperationsList()
  end

  defp getBalance(list) do
    case list do
      [] ->
        0

      list ->
        {_date, _amount, balance} = List.last(list)
        balance
    end
  end
end

# ToDo
# defp adapter, do: Application.get_env(:account, :acount)[:database]
# every function will be something like database().new(amount)
