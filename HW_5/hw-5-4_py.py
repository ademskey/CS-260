#Create a program that gives out the correct change to a customer!
# The program should:
# Have user pick a number from 1 - 99 ( an amount of change )
# add an ERROR statement if the number is not in range then re-run the program
# and output the correct amount of Quarters, Dimes, Nickels, and Pennies
# to give the customer the correct amount of change.
#3
# Use the minimum amount of coins.
# Ex: 82 cents = 3 quarters , 1 nickel, 2 pennies
# Repeat the exchange if the user wish to continue
# author: sllu (2023)
continued = True
quarter = 25
dime = 10
nickel = 5
penny = 1
cq = 0
cd = 0
cn = 0
cp = 0
while continued:
    print("Please enter the amount: ")
    answer = int(input())
    if answer > 99:
        print("Number must be between 1-99!")
        continue
    cq = answer//quarter
    remain = answer % quarter
    cd = remain//dime
    remain = remain % dime
    cn = remain//nickel
    remain = remain % nickel
    print(answer, "cents =", cq, "quarters,", cd, "dimes,", cn, "nickels,",
    remain, "pennies")
    print("More? (Y or N) ")
    wish = input()
    if wish == 'N':
        continued = False
    print("Thank you for using the coin exchange. Please come again!")