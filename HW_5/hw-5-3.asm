.data
c_value: .word 10    # initialize constant c (10)
array1: .space 400 # initialize array 1
array2: .space 100 # initialize array 2

.text
.globl main
main: 
    # Initialization of array pointers
    la      $s0, array1       # Address of array1
    la      $s1, array2       # Address of array2
    li      $t0, 0            # set loop counter i to 0
    lw      $t1, c_value      # Load c into $t1
    li      $t2, 100          # Set loop limit to 100 (array size)

loop:
    # Load a word from array2
    lw      $t4, 0($s1)       # Get word from array2
    add     $t4, $t4, $t1     # Add c to the loaded word
    sw      $t4, 0($s0)       # Store the result into array1
    addi    $s0, $s0, 4       # Move to the next entry in array1
    addi    $s1, $s1, 4       # Move to the next entry in array2
    addi    $t0, $t0, 1       # Increment loop counter i

    # Check loop condition
    blt     $t0, $t2, loop    # If i < 100, continue looping (jump to loop)

    # Exit program
    li      $v0, 10
    syscall