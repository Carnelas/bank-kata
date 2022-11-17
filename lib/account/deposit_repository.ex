defmodule Account.DepositUsecase do
  alias Account.Repo

  def addDeposit(amount) do
    get_date() |> Repo.addDeposit(amount)
  end

  def withdrawDeposit(amount) do
    get_date() |> Repo.withdrawDeposit(amount * -1)
  end

  defp get_date() do
    DateTime.utc_now() |> DateTime.to_date() |> to_string()
  end
end
