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
  test "print whole statement with transactions" do
    printed_statement = "Date || Amount || Balance
    14/01/2012 || -500 || 2500
    13/01/2012 || 2000 || 3000
    10/01/2012 || 1000 || 1000"

    Account.addDeposit(1000)
    Account.withdrawDeposit(100)
    Account.addDeposit(500)

    Account.printStatement()

    assert String.trim(capture_io(fn -> Account.printStatement() end)) ==
             String.trim(printed_statement)
  end

  # unit test
  test "can deposit" do
    amount = 10

    result = Account.addDeposit(amount)

    assert result == true
  end

  test "can withdraw" do
    amount = -100

    result = Account.withdrawDeposit(amount)

    assert result == true
  end

  test "can print statement" do
    statement = "Date || Amount || Balance"

    assert String.trim(capture_io(fn -> Account.printStatement() end)) ==
             String.trim(statement)
  end

  test "deposit shows in the balance" do
    date = get_date()

    statement = """
    Date || Amount || Balance
    #{date} || 1000 || 1000
    #{date} || 5000 || 6000
    #{date} || 10000 || 16000
    """

    Account.addDeposit(1000)
    Account.addDeposit(5000)
    Account.addDeposit(10000)

    assert String.trim(capture_io(fn -> Account.printStatement() end)) ==
             String.trim(statement)
  end

  defp get_date() do
    DateTime.to_date(DateTime.utc_now()) |> to_string()
  end
end
