.data #Data segment
value: .word 0x10, 0x20, 0 #Initializes value with 0x10 (decimal 16), 0x20 (32), 0
.text #Text segment
main:
# Store and add values
la $t0, value #loads address of value in register t0
lw $t1, 0($t0) #Loads word from t0 into t1
lw $t2, 4($t0) #Loads word from t0 into t0 offset by four bytes
add $t3, $t1, $t2 #Adds t1 and t2 and stores in t3
sw $t3, 8($t0) #Stores result of t3 into t0 offset by 8 bytes

# Print the result
move $a0, $t3       # Move the result from $t3 to $a0, which is the argument for syscall
li $v0, 1           # Load the syscall code for printing an integer (1) into $v0
syscall             # Make the syscall to print the integer in $a0

jr $ra  #Returns to calling function
 