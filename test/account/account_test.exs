defmodule Bank.AccountTest do
  @moduledoc """
  Account test suite
  """

  use ExUnit.Case

  import Mox
  import ExUnit.CaptureIO

  alias Bank.Account

  setup :verify_on_exit!

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
end
