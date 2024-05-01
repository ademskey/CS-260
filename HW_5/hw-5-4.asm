.data
prompt_msg: .asciiz "Please enter the amount: "
invalid_msg: .asciiz "Number must be between 1-99!"
more_msg: .asciiz "More? (Y or N) "
exit_msg: .asciiz "Thank you for using the coin exchange. Please come again!"
answer_str: .space 4   # Buffer to hold user input as string
answer_int: .word 0     # Buffer to hold user input as integer
cq_msg: .asciiz " quarters: "
cd_msg: .asciiz " dimes: "
cn_msg: .asciiz " nickels: "
cp_msg: .asciiz " pennies: "
newline: .asciiz "\n"   # Define a newline character

.text
.globl main

main:
    # Initialize variables
    li $t0, 1           # answer
    li $t1, 25          # quarter
    li $t2, 10           # dime
    li $t3, 5            # nickel
    li $t4, 1            # penny
    li $t5, 0            # cq
    li $t6, 0            # cd
    li $t7, 0            # cn
    li $t8, 0            # cp 
    li $t9, 1            # continued (True/False)

while_loop:

    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall

    # Print "Please enter the amount: "
    li $v0, 4 # (li loads the syscall service number into $v0)
    la $a0, prompt_msg # load address of prompt_msg
    syscall # do the system call

    # Read user input
    li $v0, 5 # load read integer syscall
    syscall # do the system call
    move $t5, $v0        # Store answer in $t5

    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall

    # Check if answer > 99
    li $t9, 100            # Load 100 into $t9
    ble $t9, $t5, invalid_answer    # If answer > 99, jump to invalid_answer
    j continue_loop       # Otherwise, jump to continue_loop

invalid_answer:
    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall

    # Print "Number must be between 1-99!"
    li $v0, 4
    la $a0, invalid_msg
    syscall
    j while_loop

    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall

continue_loop:
# Calculate coin values ############################################
    div $t5, $t1          # cq = answer // quarter
    mflo $t5              # mlfo = quotient
    mfhi $t6              # mfhi = remainder

    div $t6, $t2          # cd = remainder // dime
    mflo $t6              # quotient
    mfhi $t7              # remainder

    div $t7, $t3          # cn = remainder // nickel
    mflo $t7              # quotient
    mfhi $t8              # remainder

    div $t8, $t4          # cp = remainder // penny
    mflo $t8              # quotient
    mfhi $t9              # remainder

# Print the results
# Print Quarters
    li $v0, 4
    la $a0, cq_msg          # Print quarters message
    syscall

    li $v0, 1             # Load print integer syscall
    move $a0, $t5         # Print answer
    syscall

    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall


# Print dimes
    li $v0, 4
    la $a0, cd_msg
    syscall

    li $v0, 1
    move $a0, $t6        
    syscall

    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall

#Print Nickles
    li $v0, 4
    la $a0, cn_msg
    syscall

    li $v0, 1
    move $a0, $t7
    syscall

    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall

#print Pennies
    li $v0, 4
    la $a0, cp_msg
    syscall

    li $v0, 1
    move $a0, $t8  
    syscall

    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall

# Prompt user to continue
    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall
    
    # Print "More? (Y or N) "
    li $v0, 4
    la $a0, more_msg
    syscall

    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall

    # Read user input
    li $v0, 12 # load read character syscall
    syscall 
    move $t9, $v0        # Store answer in $t9

    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall

    # Check if wish == 'N'
    li $t7, 'N'
    bne $t7, $t9, while_loop

    # Print newline for readability
    li $v0, 4             # Load print string syscall
    la $a0, newline       # Load address of newline
    syscall

    # Print "Thank you for using the coin exchange. Please come again!"
    li $v0, 4
    la $a0, exit_msg
    syscall

    # Exit program
    li $v0, 10
    syscall