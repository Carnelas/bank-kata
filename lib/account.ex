defmodule Account do
  @moduledoc """
  Keeps the contexts that define the account
  """

  @spec addDeposit(number) :: true
  def addDeposit(amount) do
    DepositUsecase.addDeposit(amount)
  end

  @spec withdrawDeposit(number) :: true
  def withdrawDeposit(amount) do
    DepositUsecase.withdrawDeposit(amount)
  end

  @spec printStatement :: :ok
  def printStatement() do
    PrinterUsecase.printStatement()
  end
end
