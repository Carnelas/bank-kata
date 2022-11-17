defmodule Account.Repo do
  @type operations :: list()

  def addDeposit(amount) do
    balance = getBalance()
    balance = balance + amount
    :ets.insert(:operations, {"_", amount, balance})
  end

  defp getBalance() do
    case getLastOperation() do
      :operations -> 0
      key -> :ets.lookup(:operations, key)
    end
  end

  defp getLastOperation() do
    case :ets.whereis(:operations) do
      :undefined -> :ets.new(:operations, [:set, :public, :named_table])
      _ -> :ets.last(:operations)
    end
  end
end
