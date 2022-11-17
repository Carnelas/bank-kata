defmodule AccountTest do
  @moduledoc """
  Account test suite
  """

  use ExUnit.Case, async: true

  import Mox
  import ExUnit.CaptureIO

  alias Account
  # alias Account.Repo.Adapter.Mock, as: AccountMock

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
  test "can_deposit" do
    amount = 10

    result = Account.addDeposit(amount)

    assert result == true
  end

  test "can print statement" do
    statement = "Date || Amount || Balance"

    assert capture_io(fn -> Account.printStatement() end) ==
             statement <> "\n"
  end

  test "deposit shows in the balance" do
    statement = "Date || Amount || Balance
    _ || 1000 || 1000"

    Account.addDeposit(1000)

    assert capture_io(fn -> Account.printStatement() end) ==
             statement <> "\n"
  end
end
