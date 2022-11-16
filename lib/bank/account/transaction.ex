defmodule Bank.Account.Transaction do
  @moduledoc """
  Transaction struct
  """

  alias __MODULE__

  @type date :: String.t()
  @type money :: non_neg_integer()
  @type balance :: non_neg_integer()

  @type t :: %Transaction{
          date: date,
          money: money,
          balance: balance
        }

  defstruct [
    :date,
    :money,
    :balance
  ]
end
