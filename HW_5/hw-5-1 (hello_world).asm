.data               # Data declaration section
hello_world: .asciiz "Hello, World\n"   # String to be printed

.text               # Code section
.globl main         # Global label for the entry point

main:               # Main program label
    li $v0, 4       # Load the print string syscall number into $v0
    la $a0, hello_world  # Load the address of the hello_world string into $a0
    syscall         # Make the syscall to print the string

    li $v0, 10      # Load the exit syscall number into $v0
    syscall         # Make the syscall to exit the program