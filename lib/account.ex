defmodule Account do
  @moduledoc """
  Keeps the contexts that define the account
  """

  def addDeposit(amount) do
    DepositUsecase.addDeposit(amount)
  end

  def printStatement() do
    PrinterUsecase.printStatement()
  end
end
