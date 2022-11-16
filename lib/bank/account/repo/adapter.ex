defmodule Bank.Account.Repo.Adapter do
  @moduledoc false

  # addDeposit

  alias Bank.Account.Transaction

  @type amount :: non_neg_integer()
  @type transaction :: Transaction.t()

  @type on_addDeposit :: {:ok, transaction} | {:error, term}

  @callback addDeposit(amount) :: on_addDeposit
end
