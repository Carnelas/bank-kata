# Account

## Main functions of the Account

- addDeposit allows you to insert a deposit.

    - Needs one integer as a parameter.

    - Expected to return true or error.


- withdrawDeposit allows you to withdraw a deposit. 

    - Needs one integer as a parameter.

    - Expected to return true or error.

- printStatement allows you to print all the existing operations

    - Expected to return a String with specific order with the operation date, amount and balance


## ToDo list

- [ ] Automatize the configuration so the app will use the MockedDB in test envs and a real DB (not implemented) in prod

- [ ] Clean git story


---------------------------------------------------------------------------------------------------------------------------


## Objetive

Create a account account app that do these three functions

*-* deposit( amount int )

*-* withdraw( amount int )

*-* printStatement ( )

-> Not allowed to add any other methods

-> Use Strings for dates and Integers for amounts

-> Don't worry about spaces in the statement

## First step

Make a concurrent test that will be able to print the statement like:

Date       || Amount || Balance

14/01/2012 || -500   || 2500

13/01/2012 || 2000   || 3000

10/01/2012 || 1000   || 1000



