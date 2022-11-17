defmodule DepositUsecase do
  alias Account.Repo

  def addDeposit(amount) do
    Repo.addDeposit(amount)
  end
end
