defmodule DepositUsecase do
  alias Account.Repo

  def addDeposit(amount) do
    Repo.addDeposit(amount)
  end

  def withdrawDeposit(amount) do
    Repo.withdrawDeposit(amount * -1)
  end
end
