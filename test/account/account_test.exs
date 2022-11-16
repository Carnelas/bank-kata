defmodule Bank.AccountTest do
  @moduledoc """
  Account test suite
  """

  use ExUnit.Case

  import Mox
  import ExUnit.CaptureIO

  alias Bank.Account
  alias Bank.Account.Repo.Adapter.Mock, as: AccountMock
  alias Bank.Account.Transaction

  setup :verify_on_exit!

  # acceptance test
  test "print_statement_with_transactions" do
    printed_statement = "Date || Amount || Balance
    14/01/2012 || -500 || 2500
    13/01/2012 || 2000 || 3000
    10/01/2012 || 1000 || 1000"

    Account.addDeposit(1000)
    Account.withdraw(100)
    Account.addDeposit(500)

    Account.printStatement()

    assert capture_io(fn -> Account.printStatement() end) ==
             printed_statement <> "\n"
  end

  # unit test

  test "addDeposit_add_a_transaction" do
    transaction = %Transaction{
      date: "10/01/2012",
      money: 1000,
      balance: 1000
    }

    expect(AccountMock, :addDeposit, fn 1000 -> {:ok, transaction} end)

    assert {:ok, transaction} == Account.addDeposit(1000)
  end
end
