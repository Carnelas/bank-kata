# Account

## Objetive

Create a account account app that do these three functions

*-* deposit( amount int )

*-* withdraw( amount int, date strings )

*-* printStatement ( date strings, amount int, balance int )

-> Not allowed to add any other methods
-> Use Strings for dates and Integers for amounts
-> Don't worry about spaces in the statement

## First step

Make a concurrent test that will be able to print the statement like:

Date       || Amount || Balance
14/01/2012 || -500   || 2500
13/01/2012 || 2000   || 3000
10/01/2012 || 1000   || 1000

## ToDo List

- [] Improve the implementation of Date.
    -> Right now we are not storing the Date so we are printing the date of the print instead of the date of the operation.
    -> How? 

- [] Make a switch so it will use the MockedDB in test envs and a real one (no implemented) in prod
- [] 