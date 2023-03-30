# ordinamento crescente di un vettore di interi

# definizione della procedura swap
swap:
addi $sp, $sp, -8
sw $a0, 0($sp)
sw $a1, 4($sp)
lw $t0, 0($a0)
lw $t1, 0($a1)
sw $t0, 0($a1)
sw $t1, 0($a0)
lw $a0, 0($sp)
lw $a1, 4($sp)
addi $sp, $sp, 8
jr $ra

# definizione della procedura sort
sort:
addi $sp, $sp, -20
sw $ra, 16($sp)
sw $s3, 12($sp)
sw $s2,  8($sp)
sw $s1,  4($sp)
sw $s0,  0($sp)

# corpo della procedura
add $s2, $a0, $zero               # $s2 = $a0
add $s3, $a1, $zero               # $s3 = $a1

# loop esterno
add $s0, $zero, $zero             # i = 0
for1tst: slt $t0, $s0, $s3        # $t0=0 se $s0 >= $s3  (i >= n) 
beq $t0, $zero, exit1             # go to exit1 se $s0 >= $s3 (i >= n)

# loop interno
addi $s1, $s0, -1                 # j = i-1
for2tst: slti $t0, $s1, 0         # $t0=1 se $s1 < 0  (j < 0)
bne $t0, $zero, exit2             # go to exit2 se $s1 < 0 (j < 0) 

sll $t1, $s1, 2                   # $t1 = j * 4
add $t2, $s2, $t1                 # $t2 = v + (j * 4)
lw $t3, 0($t2)                    # $t3 = v[j]
lw $t4, 4($t2)                    # $t4 = v[j+1]
slt $t0, $t4, $t3                 # $t0=0 se $t4 >= $t3 (v[j+1] >= v[j])
beq $t0, $zero, exit2  

# passaggio dei parametri e chiamata di swap
add $a0, $s2, $zero
add $a1, $s1, $zero
jal swap                           # fine loop interno

addi $s1, $s1, -1                  # j = j - 1
j for2tst

# fine loop esterno
exit2:addi $s0, $s0, 1             # i = i + 1
j for1tst

# ripristina i registri salvati nello stack
exit1:
lw $s0,  0($sp)
lw $s1, 4($sp)
lw $s2, 8($sp)
lw $s3, 12($sp)
