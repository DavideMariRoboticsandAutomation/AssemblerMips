PC       = 0
EPC      = 0
Cause    = 0
BadVAddr = 0
Status   = 3000ff10

HI       = 0
LO       = 0

R0  [r0] = 0
R1  [at] = 0
R2  [v0] = 0
R3  [v1] = 0
R4  [a0] = 1
R5  [a1] = 7ffff798
R6  [a2] = 7ffff7a0
R7  [a3] = 0
R8  [t0] = 0
R9  [t1] = 0
R10 [t2] = 0
R11 [t3] = 0
R12 [t4] = 0
R13 [t5] = 0
R14 [t6] = 0
R15 [t7] = 0
R16 [s0] = 0
R17 [s1] = 0
R18 [s2] = 0
R19 [s3] = 0
R20 [s4] = 0
R21 [s5] = 0
R22 [s6] = 0
R23 [s7] = 0
R24 [t8] = 0
R25 [t9] = 0
R26 [k0] = 0
R27 [k1] = 0
R28 [gp] = 10008000
R29 [sp] = 7ffff794
R30 [s8] = 0
R31 [ra] = 0


User Text Segment [00400000]..[00440000]
[00400000] 8fa40000  lw $4, 0($29)            ; 183: lw $a0 0($sp) # argc 
[00400004] 27a50004  addiu $5, $29, 4         ; 184: addiu $a1 $sp 4 # argv 
[00400008] 24a60004  addiu $6, $5, 4          ; 185: addiu $a2 $a1 4 # envp 
[0040000c] 00041080  sll $2, $4, 2            ; 186: sll $v0 $a0 2 
[00400010] 00c23021  addu $6, $6, $2          ; 187: addu $a2 $a2 $v0 
[00400014] 0c000000  jal 0x00000000 [main]    ; 188: jal main 
[00400018] 00000000  nop                      ; 189: nop 
[0040001c] 3402000a  ori $2, $0, 10           ; 191: li $v0 10 
[00400020] 0000000c  syscall                  ; 192: syscall # syscall 10 (exit) 
[00400024] 23bdffec  addi $29, $29, -20       ; 3: addi $sp, $sp, -20 # Reservo spazio per 5 registri sullo stack 
[00400028] afbf0010  sw $31, 16($29)          ; 4: sw $ra, 16($sp) # Salvo il registro $ra nello stack 
[0040002c] afb0000c  sw $16, 12($29)          ; 5: sw $s0, 12($sp) # Salvo il registro $s0 nello stack 
[00400030] afb10008  sw $17, 8($29)           ; 6: sw $s1, 8($sp) # Salvo il registro $s1 nello stack 
[00400034] afb20004  sw $18, 4($29)           ; 7: sw $s2, 4($sp) # Salvo il registro $s2 nello stack 
[00400038] afb30000  sw $19, 0($29)           ; 8: sw $s3, 0($sp) # Salvo il registro $s3 nello stack 
[0040003c] 00809020  add $18, $4, $0          ; 11: add $s2, $a0, $zero # $s2 = $a0 (puntatore al vettore) 
[00400040] 00a09820  add $19, $5, $0          ; 12: add $s3, $a1, $zero # $s3 = $a1 (dimensione del vettore) 
[00400044] 20100000  addi $16, $0, 0          ; 13: addi $s0, $zero, 0 # $s0 = 0 (i = 0) 
[00400048] 0213402a  slt $8, $16, $19         ; 17: slt $t0, $s0, $s3 # $t0 = 1 se i 
[0040004c] 1100004e  beq $8, $0, 312 [exit1-0x0040004c]
[00400050] 2211ffff  addi $17, $16, -1        ; 21: addi $s1, $s0, -1 # $s1 = i - 1 
[00400054] 2a280000  slti $8, $17, 0          ; 23: slti $t0, $s1, 0 # $t0 = 1 se j 
[00400058] 11000049  beq $8, $0, 292 [exit2-0x00400058]
[0040005c] 00114880  sll $9, $17, 2           ; 27: sll $t1, $s1, 2 # $t1 = j * 4 (offset nel vettore) 
[00400060] 02495020  add $10, $18, $9         ; 28: add $t2, $s2, $t1 # $t2 = v + (j * 4) (indirizzo di v[j]) 
[00400064] 8d4b0000  lw $11, 0($10)           ; 29: lw $t3, ($t2) # $t3 = v[j] 
[00400068] 8d4c0004  lw $12, 4($10)           ; 30: lw $t4, 4($t2) # $t4 = v[j+1] 
[0040006c] 018b402a  slt $8, $12, $11         ; 33: slt $t0, $t4, $t3 # $t0 = 1 se v[j+1] 
[00400070] 11000043  beq $8, $0, 268 [exit2-0x00400070]
[00400074] 02402020  add $4, $18, $0          ; 37: add $a0, $s2, $zero # $a0 = v 
[00400078] 02202820  add $5, $17, $0          ; 38: add $a1, $s1, $zero # $a1 = j 
[0040007c] 0c10003b  jal 0x004000ec [swap]    ; 39: jal swap # Chiamo la funzione swap 
[00400080] 2231ffff  addi $17, $17, -1        ; 42: addi $s1, $s1, -1 # $s1 = j - 1 
[00400084] 08100015  j 0x00400054 [for2tst]   ; 43: j for2tst 
[00400088] 23bdffec  addi $29, $29, -20       ; 3: addi $sp, $sp, -20 # Reservo spazio per 5 registri sullo stack 
[0040008c] afbf0010  sw $31, 16($29)          ; 4: sw $ra, 16($sp) # Salvo il registro $ra nello stack 
[00400090] afb0000c  sw $16, 12($29)          ; 5: sw $s0, 12($sp) # Salvo il registro $s0 nello stack 
[00400094] afb10008  sw $17, 8($29)           ; 6: sw $s1, 8($sp) # Salvo il registro $s1 nello stack 
[00400098] afb20004  sw $18, 4($29)           ; 7: sw $s2, 4($sp) # Salvo il registro $s2 nello stack 
[0040009c] afb30000  sw $19, 0($29)           ; 8: sw $s3, 0($sp) # Salvo il registro $s3 nello stack 
[004000a0] 00809020  add $18, $4, $0          ; 11: add $s2, $a0, $zero # $s2 = $a0 (puntatore al vettore) 
[004000a4] 00a09820  add $19, $5, $0          ; 12: add $s3, $a1, $zero # $s3 = $a1 (dimensione del vettore) 
[004000a8] 20100000  addi $16, $0, 0          ; 13: addi $s0, $zero, 0 # $s0 = 0 (i = 0) 
[004000ac] 0213402a  slt $8, $16, $19         ; 17: slt $t0, $s0, $s3 # $t0 = 1 se i 
[004000b0] 11000035  beq $8, $0, 212 [exit1-0x004000b0]
[004000b4] 2211ffff  addi $17, $16, -1        ; 21: addi $s1, $s0, -1 # $s1 = i - 1 
[004000b8] 2a280000  slti $8, $17, 0          ; 23: slti $t0, $s1, 0 # $t0 = 1 se j 
[004000bc] 11000030  beq $8, $0, 192 [exit2-0x004000bc]
[004000c0] 00114880  sll $9, $17, 2           ; 27: sll $t1, $s1, 2 # $t1 = j * 4 (offset nel vettore) 
[004000c4] 02495020  add $10, $18, $9         ; 28: add $t2, $s2, $t1 # $t2 = v + (j * 4) (indirizzo di v[j]) 
[004000c8] 8d4b0000  lw $11, 0($10)           ; 29: lw $t3, ($t2) # $t3 = v[j] 
[004000cc] 8d4c0004  lw $12, 4($10)           ; 30: lw $t4, 4($t2) # $t4 = v[j+1] 
[004000d0] 018b402a  slt $8, $12, $11         ; 33: slt $t0, $t4, $t3 # $t0 = 1 se v[j+1] 
[004000d4] 1100002a  beq $8, $0, 168 [exit2-0x004000d4]
[004000d8] 02402020  add $4, $18, $0          ; 37: add $a0, $s2, $zero # $a0 = v 
[004000dc] 02202820  add $5, $17, $0          ; 38: add $a1, $s1, $zero # $a1 = j 
[004000e0] 0c10003b  jal 0x004000ec [swap]    ; 39: jal swap # Chiamo la funzione swap 
[004000e4] 2231ffff  addi $17, $17, -1        ; 42: addi $s1, $s1, -1 # $s1 = j - 1 
[004000e8] 0810002e  j 0x004000b8 [for2tst]   ; 43: j for2tst 
[004000ec] 23bdfff8  addi $29, $29, -8        ; 5: addi $sp, $sp, -8 
[004000f0] afa40000  sw $4, 0($29)            ; 6: sw $a0, 0($sp) 
[004000f4] afa50004  sw $5, 4($29)            ; 7: sw $a1, 4($sp) 
[004000f8] 8c880000  lw $8, 0($4)             ; 8: lw $t0, 0($a0) 
[004000fc] 8ca90000  lw $9, 0($5)             ; 9: lw $t1, 0($a1) 
[00400100] aca80000  sw $8, 0($5)             ; 10: sw $t0, 0($a1) 
[00400104] ac890000  sw $9, 0($4)             ; 11: sw $t1, 0($a0) 
[00400108] 8fa40000  lw $4, 0($29)            ; 12: lw $a0, 0($sp) 
[0040010c] 8fa50004  lw $5, 4($29)            ; 13: lw $a1, 4($sp) 
[00400110] 23bd0008  addi $29, $29, 8         ; 14: addi $sp, $sp, 8 
[00400114] 03e00008  jr $31                   ; 15: jr $ra 
[00400118] 23bdffec  addi $29, $29, -20       ; 19: addi $sp, $sp, -20 
[0040011c] afbf0010  sw $31, 16($29)          ; 20: sw $ra, 16($sp) 
[00400120] afb3000c  sw $19, 12($29)          ; 21: sw $s3, 12($sp) 
[00400124] afb20008  sw $18, 8($29)           ; 22: sw $s2, 8($sp) 
[00400128] afb10004  sw $17, 4($29)           ; 23: sw $s1, 4($sp) 
[0040012c] afb00000  sw $16, 0($29)           ; 24: sw $s0, 0($sp) 
[00400130] 00809020  add $18, $4, $0          ; 27: add $s2, $a0, $zero # $s2 = $a0 
[00400134] 00a09820  add $19, $5, $0          ; 28: add $s3, $a1, $zero # $s3 = $a1 
[00400138] 00008020  add $16, $0, $0          ; 31: add $s0, $zero, $zero # i = 0 
[0040013c] 0213402a  slt $8, $16, $19         ; 32: slt $t0, $s0, $s3 # $t0=0 se $s0 >= $s3 (i >= n) 
[00400140] 11000011  beq $8, $0, 68 [exit1-0x00400140]
[00400144] 2211ffff  addi $17, $16, -1        ; 36: addi $s1, $s0, -1 # j = i-1 
[00400148] 2a280000  slti $8, $17, 0          ; 37: slti $t0, $s1, 0 # $t0=1 se $s1 
[0040014c] 1500000c  bne $8, $0, 48 [exit2-0x0040014c]
[00400150] 00114880  sll $9, $17, 2           ; 40: sll $t1, $s1, 2 # $t1 = j * 4 
[00400154] 02495020  add $10, $18, $9         ; 41: add $t2, $s2, $t1 # $t2 = v + (j * 4) 
[00400158] 8d4b0000  lw $11, 0($10)           ; 42: lw $t3, 0($t2) # $t3 = v[j] 
[0040015c] 8d4c0004  lw $12, 4($10)           ; 43: lw $t4, 4($t2) # $t4 = v[j+1] 
[00400160] 018b402a  slt $8, $12, $11         ; 44: slt $t0, $t4, $t3 # $t0=0 se $t4 >= $t3 (v[j+1] >= v[j]) 
[00400164] 11000006  beq $8, $0, 24 [exit2-0x00400164]
[00400168] 02402020  add $4, $18, $0          ; 48: add $a0, $s2, $zero 
[0040016c] 02202820  add $5, $17, $0          ; 49: add $a1, $s1, $zero 
[00400170] 0c10003b  jal 0x004000ec [swap]    ; 50: jal swap # fine loop interno 
[00400174] 2231ffff  addi $17, $17, -1        ; 52: addi $s1, $s1, -1 # j = j - 1 
[00400178] 08100052  j 0x00400148 [for2tst]   ; 53: j for2tst 
[0040017c] 22100001  addi $16, $16, 1         ; 56: addi $s0, $s0, 1 # i = i + 1 
[00400180] 0810004f  j 0x0040013c [for1tst]   ; 57: j for1tst 
[00400184] 8fb00000  lw $16, 0($29)           ; 61: lw $s0, 0($sp) 
[00400188] 8fb10004  lw $17, 4($29)           ; 62: lw $s1, 4($sp) 
[0040018c] 8fb20008  lw $18, 8($29)           ; 63: lw $s2, 8($sp) 
[00400190] 8fb3000c  lw $19, 12($29)          ; 64: lw $s3, 12($sp) 

Kernel Text Segment [80000000]..[80010000]
[80000180] 0001d821  addu $27, $0, $1         ; 90: move $k1 $at # Save $at 
[80000184] 3c019000  lui $1, -28672           ; 92: sw $v0 s1 # Not re-entrant and we can't trust $sp 
[80000188] ac220200  sw $2, 512($1)           
[8000018c] 3c019000  lui $1, -28672           ; 93: sw $a0 s2 # But we need to use these registers 
[80000190] ac240204  sw $4, 516($1)           
[80000194] 401a6800  mfc0 $26, $13            ; 95: mfc0 $k0 $13 # Cause register 
[80000198] 001a2082  srl $4, $26, 2           ; 96: srl $a0 $k0 2 # Extract ExcCode Field 
[8000019c] 3084001f  andi $4, $4, 31          ; 97: andi $a0 $a0 0x1f 
[800001a0] 34020004  ori $2, $0, 4            ; 101: li $v0 4 # syscall 4 (print_str) 
[800001a4] 3c049000  lui $4, -28672 [__m1_]   ; 102: la $a0 __m1_ 
[800001a8] 0000000c  syscall                  ; 103: syscall 
[800001ac] 34020001  ori $2, $0, 1            ; 105: li $v0 1 # syscall 1 (print_int) 
[800001b0] 001a2082  srl $4, $26, 2           ; 106: srl $a0 $k0 2 # Extract ExcCode Field 
[800001b4] 3084001f  andi $4, $4, 31          ; 107: andi $a0 $a0 0x1f 
[800001b8] 0000000c  syscall                  ; 108: syscall 
[800001bc] 34020004  ori $2, $0, 4            ; 110: li $v0 4 # syscall 4 (print_str) 
[800001c0] 3344003c  andi $4, $26, 60         ; 111: andi $a0 $k0 0x3c 
[800001c4] 3c019000  lui $1, -28672           ; 112: lw $a0 __excp($a0) 
[800001c8] 00240821  addu $1, $1, $4          
[800001cc] 8c240180  lw $4, 384($1)           
[800001d0] 00000000  nop                      ; 113: nop 
[800001d4] 0000000c  syscall                  ; 114: syscall 
[800001d8] 34010018  ori $1, $0, 24           ; 116: bne $k0 0x18 ok_pc # Bad PC exception requires special checks 
[800001dc] 143a0008  bne $1, $26, 32 [ok_pc-0x800001dc] 
[800001e0] 00000000  nop                      ; 117: nop 
[800001e4] 40047000  mfc0 $4, $14             ; 119: mfc0 $a0 $14 # EPC 
[800001e8] 30840003  andi $4, $4, 3           ; 120: andi $a0 $a0 0x3 # Is EPC word-aligned? 
[800001ec] 10040004  beq $0, $4, 16 [ok_pc-0x800001ec]
[800001f0] 00000000  nop                      ; 122: nop 
[800001f4] 3402000a  ori $2, $0, 10           ; 124: li $v0 10 # Exit on really bad PC 
[800001f8] 0000000c  syscall                  ; 125: syscall 
[800001fc] 34020004  ori $2, $0, 4            ; 128: li $v0 4 # syscall 4 (print_str) 
[80000200] 3c019000  lui $1, -28672 [__m2_]   ; 129: la $a0 __m2_ 
[80000204] 3424000d  ori $4, $1, 13 [__m2_]   
[80000208] 0000000c  syscall                  ; 130: syscall 
[8000020c] 001a2082  srl $4, $26, 2           ; 132: srl $a0 $k0 2 # Extract ExcCode Field 
[80000210] 3084001f  andi $4, $4, 31          ; 133: andi $a0 $a0 0x1f 
[80000214] 14040002  bne $0, $4, 8 [ret-0x80000214]; 134: bne $a0 0 ret # 0 means exception was an interrupt 
[80000218] 00000000  nop                      ; 135: nop 
[8000021c] 401a7000  mfc0 $26, $14            ; 145: mfc0 $k0 $14 # Bump EPC register 
[80000220] 275a0004  addiu $26, $26, 4        ; 146: addiu $k0 $k0 4 # Skip faulting instruction 
[80000224] 409a7000  mtc0 $26, $14            ; 148: mtc0 $k0 $14 
[80000228] 3c019000  lui $1, -28672           ; 153: lw $v0 s1 # Restore other registers 
[8000022c] 8c220200  lw $2, 512($1)           
[80000230] 3c019000  lui $1, -28672           ; 154: lw $a0 s2 
[80000234] 8c240204  lw $4, 516($1)           
[80000238] 001b0821  addu $1, $0, $27         ; 157: move $at $k1 # Restore $at 
[8000023c] 40806800  mtc0 $0, $13             ; 160: mtc0 $0 $13 # Clear Cause register 
[80000240] 401a6000  mfc0 $26, $12            ; 162: mfc0 $k0 $12 # Set Status register 
[80000244] 375a0001  ori $26, $26, 1          ; 163: ori $k0 0x1 # Interrupts enabled 
[80000248] 409a6000  mtc0 $26, $12            ; 164: mtc0 $k0 $12 
[8000024c] 42000018  eret                     ; 167: eret 


User data segment [10000000]..[10040000]
[10000000]..[1003ffff]  00000000


User Stack [7ffff794]..[80000000]
[7ffff794]    00000001  7ffff854  00000000              . . . . T . . . . . . . 
[7ffff7a0]    7fffffe1  7fffffb9  7fffff7c  7fffff4b    . . . . . . . . | . . . K . . . 
[7ffff7b0]    7fffff0f  7ffffede  7ffffec1  7ffffe9d    . . . . . . . . . . . . . . . . 
[7ffff7c0]    7ffffe6b  7ffffe3a  7ffffe12  7ffffe05    k . . . : . . . . . . . . . . . 
[7ffff7d0]    7ffffdee  7ffffdc3  7ffffda5  7ffffd8d    . . . . . . . . . . . . . . . . 
[7ffff7e0]    7ffffd6b  7ffffd5d  7ffffbe0  7ffffba2    k . . . ] . . . . . . . . . . . 
[7ffff7f0]    7ffffb85  7ffffb3c  7ffffb2a  7ffffb12    . . . . < . . . * . . . . . . . 
[7ffff800]    7ffffaf7  7ffffad9  7ffffab0  7ffffa92    . . . . . . . . . . . . . . . . 
[7ffff810]    7ffffa27  7ffffa10  7ffff9fc  7ffff9b3    ' . . . . . . . . . . . . . . . 
[7ffff820]    7ffff974  7ffff965  7ffff94f  7ffff927    t . . . e . . . O . . . ' . . . 
[7ffff830]    7ffff900  7ffff8e5  7ffff8bb  7ffff8ab    . . . . . . . . . . . . . . . . 
[7ffff840]    7ffff88f  7ffff87d  00000000  00000000    . . . . } . . . . . . . . . . . 
[7ffff850]    00000000  552f3a43  73726573  7661442f    . . . . C : / U s e r s / D a v 
[7ffff860]    2f656469  6b736544  2f706f74  6d617345    i d e / D e s k t o p / E s a m 
[7ffff870]    38315f65  5f34305f  732e3132  6e697700    e _ 1 8 _ 0 4 _ 2 1 . s . w i n 
[7ffff880]    3d726964  575c3a43  6f646e69  55007377    d i r = C : \ W i n d o w s . U 
[7ffff890]    50524553  49464f52  433d454c  73555c3a    S E R P R O F I L E = C : \ U s 
[7ffff8a0]    5c737265  69766144  55006564  4e524553    e r s \ D a v i d e . U S E R N 
[7ffff8b0]    3d454d41  69766144  55006564  44524553    A M E = D a v i d e . U S E R D 
[7ffff8c0]    49414d4f  4f525f4e  4e494d41  4f525047    O M A I N _ R O A M I N G P R O 
[7ffff8d0]    454c4946  5345443d  504f544b  5641512d    F I L E = D E S K T O P - Q A V 
[7ffff8e0]    4b493856  45535500  4d4f4452  3d4e4941    V 8 I K . U S E R D O M A I N = 
[7ffff8f0]    4b534544  2d504f54  56564151  004b4938    D E S K T O P - Q A V V 8 I K . 
[7ffff900]    3d504d54  555c3a43  73726573  7661445c    T M P = C : \ U s e r s \ D a v 
[7ffff910]    5c656469  44707041  5c617461  61636f4c    i d e \ A p p D a t a \ L o c a 
[7ffff920]    65545c6c  5400706d  3d504d45  555c3a43    l \ T e m p . T E M P = C : \ U 
[7ffff930]    73726573  7661445c  5c656469  44707041    s e r s \ D a v i d e \ A p p D 
[7ffff940]    5c617461  61636f4c  65545c6c  5300706d    a t a \ L o c a l \ T e m p . S 
[7ffff950]    65747379  6f6f526d  3a433d74  6e69575c    y s t e m R o o t = C : \ W i n 
[7ffff960]    73776f64  73795300  446d6574  65766972    d o w s . S y s t e m D r i v e 
[7ffff970]    003a433d  616d6953  5f636974  5f4d414f    = C : . S i m a t i c _ O A M _ 
[7ffff980]    41544144  5c3a433d  676f7250  446d6172    D A T A = C : \ P r o g r a m D 
[7ffff990]    5c617461  6d656953  5c736e65  6f747541    a t a \ S i e m e n s \ A u t o 
[7ffff9a0]    6974616d  535c6e6f  74616d69  4f206369    m a t i o n \ S i m a t i c   O 
[7ffff9b0]    53004d41  74616d69  4f5f6369  433d4d41    A M . S i m a t i c _ O A M = C 
[7ffff9c0]    72505c3a  6172676f  6946206d  5c73656c    : \ P r o g r a m   F i l e s \ 
[7ffff9d0]    6d6d6f43  46206e6f  73656c69  6569535c    C o m m o n   F i l e s \ S i e 
[7ffff9e0]    736e656d  7475415c  74616d6f  5c6e6f69    m e n s \ A u t o m a t i o n \ 
[7ffff9f0]    616d6953  20636974  004d414f  53534553    S i m a t i c   O A M . S E S S 
[7ffffa00]    4e4e4f49  3d454d41  736e6f43  00656c6f    I O N N A M E = C o n s o l e . 
[7ffffa10]    4c425550  433d4349  73555c3a  5c737265    P U B L I C = C : \ U s e r s \ 
[7ffffa20]    6c627550  50006369  646f4d53  50656c75    P u b l i c . P S M o d u l e P 
[7ffffa30]    3d687461  505c3a43  72676f72  46206d61    a t h = C : \ P r o g r a m   F 
[7ffffa40]    73656c69  6e69575c  73776f64  65776f50    i l e s \ W i n d o w s P o w e 
[7ffffa50]    65685372  4d5c6c6c  6c75646f  433b7365    r S h e l l \ M o d u l e s ; C 
[7ffffa60]    69575c3a  776f646e  79735c73  6d657473    : \ W i n d o w s \ s y s t e m 
[7ffffa70]    575c3233  6f646e69  6f507377  53726577    3 2 \ W i n d o w s P o w e r S 
[7ffffa80]    6c6c6568  2e31765c  6f4d5c30  656c7564    h e l l \ v 1 . 0 \ M o d u l e 
[7ffffa90]    72500073  6172676f  3436576d  433d3233    s . P r o g r a m W 6 4 3 2 = C 
[7ffffaa0]    72505c3a  6172676f  6946206d  0073656c    : \ P r o g r a m   F i l e s . 
[7ffffab0]    676f7250  466d6172  73656c69  36387828    P r o g r a m F i l e s ( x 8 6 
[7ffffac0]    3a433d29  6f72505c  6d617267  6c694620    ) = C : \ P r o g r a m   F i l 
[7ffffad0]    28207365  29363878  6f725000  6d617267    e s   ( x 8 6 ) . P r o g r a m 
[7ffffae0]    656c6946  3a433d73  6f72505c  6d617267    F i l e s = C : \ P r o g r a m 
[7ffffaf0]    6c694620  50007365  72676f72  61446d61      F i l e s . P r o g r a m D a 
[7ffffb00]    433d6174  72505c3a  6172676f  7461446d    t a = C : \ P r o g r a m D a t 
[7ffffb10]    52500061  5345434f  5f524f53  49564552    a . P R O C E S S O R _ R E V I 
[7ffffb20]    4e4f4953  3035613d  52500033  5345434f    S I O N = a 5 0 3 . P R O C E S 
[7ffffb30]    5f524f53  4556454c  00363d4c  434f5250    S O R _ L E V E L = 6 . P R O C 
[7ffffb40]    4f535345  44495f52  49544e45  52454946    E S S O R _ I D E N T I F I E R 
[7ffffb50]    746e493d  34366c65  6d614620  20796c69    = I n t e l 6 4   F a m i l y   
[7ffffb60]    6f4d2036  206c6564  20353631  70657453    6   M o d e l   1 6 5   S t e p 
[7ffffb70]    676e6970  202c3320  756e6547  49656e69    p i n g   3 ,   G e n u i n e I 
[7ffffb80]    6c65746e  4f525000  53534543  415f524f    n t e l . P R O C E S S O R _ A 
[7ffffb90]    49484352  54434554  3d455255  36444d41    R C H I T E C T U R E = A M D 6 
[7ffffba0]    41500034  58454854  432e3d54  2e3b4d4f    4 . P A T H E X T = . C O M ; . 
[7ffffbb0]    3b455845  5441422e  4d432e3b  562e3b44    E X E ; . B A T ; . C M D ; . V 
[7ffffbc0]    2e3b5342  3b454256  3b534a2e  45534a2e    B S ; . V B E ; . J S ; . J S E 
[7ffffbd0]    53572e3b  572e3b46  2e3b4853  0043534d    ; . W S F ; . W S H ; . M S C . 
[7ffffbe0]    68746150  5c3a433d  676f7250  206d6172    P a t h = C : \ P r o g r a m   
[7ffffbf0]    656c6946  6f435c73  6e6f6d6d  6c694620    F i l e s \ C o m m o n   F i l 
[7ffffc00]    535c7365  656d6569  415c736e  6d6f7475    e s \ S i e m e n s \ A u t o m 
[7ffffc10]    6f697461  69535c6e  6974616d  414f2063    a t i o n \ S i m a t i c   O A 
[7ffffc20]    69625c4d  3a433b6e  6f72505c  6d617267    M \ b i n ; C : \ P r o g r a m 
[7ffffc30]    6c694620  28207365  29363878  6d6f435c      F i l e s   ( x 8 6 ) \ C o m 
[7ffffc40]    206e6f6d  656c6946  724f5c73  656c6361    m o n   F i l e s \ O r a c l e 
[7ffffc50]    76614a5c  616a5c61  61706176  433b6874    \ J a v a \ j a v a p a t h ; C 
[7ffffc60]    69575c3a  776f646e  79735c73  6d657473    : \ W i n d o w s \ s y s t e m 
[7ffffc70]    433b3233  69575c3a  776f646e  3a433b73    3 2 ; C : \ W i n d o w s ; C : 
[7ffffc80]    6e69575c  73776f64  7379535c  336d6574    \ W i n d o w s \ S y s t e m 3 
[7ffffc90]    62575c32  433b6d65  69575c3a  776f646e    2 \ W b e m ; C : \ W i n d o w 
[7ffffca0]    79535c73  6d657473  575c3233  6f646e69    s \ S y s t e m 3 2 \ W i n d o 
[7ffffcb0]    6f507377  53726577  6c6c6568  2e31765c    w s P o w e r S h e l l \ v 1 . 
[7ffffcc0]    433b5c30  69575c3a  776f646e  79535c73    0 \ ; C : \ W i n d o w s \ S y 
[7ffffcd0]    6d657473  4f5c3233  536e6570  3b5c4853    s t e m 3 2 \ O p e n S S H \ ; 
[7ffffce0]    505c3a43  72676f72  46206d61  73656c69    C : \ P r o g r a m   F i l e s 
[7ffffcf0]    746f645c  5c74656e  5c3a433b  72657355    \ d o t n e t \ ; C : \ U s e r 
[7ffffd00]    61445c73  65646976  7070415c  61746144    s \ D a v i d e \ A p p D a t a 
[7ffffd10]    636f4c5c  4d5c6c61  6f726369  74666f73    \ L o c a l \ M i c r o s o f t 
[7ffffd20]    6e69575c  73776f64  73707041  5c3a433b    \ W i n d o w s A p p s ; C : \ 
[7ffffd30]    72657355  61445c73  65646976  7070415c    U s e r s \ D a v i d e \ A p p 
[7ffffd40]    61746144  636f4c5c  475c6c61  75487469    D a t a \ L o c a l \ G i t H u 
[7ffffd50]    73654462  706f746b  6e69625c  3d534f00    b D e s k t o p \ b i n . O S = 
[7ffffd60]    646e6957  5f73776f  4f00544e  7244656e    W i n d o w s _ N T . O n e D r 
[7ffffd70]    3d657669  555c3a43  73726573  7661445c    i v e = C : \ U s e r s \ D a v 
[7ffffd80]    5c656469  44656e4f  65766972  4d554e00    i d e \ O n e D r i v e . N U M 
[7ffffd90]    5f524542  505f464f  45434f52  524f5353    B E R _ O F _ P R O C E S S O R 
[7ffffda0]    32313d53  474f4c00  45534e4f  52455652    S = 1 2 . L O G O N S E R V E R 
[7ffffdb0]    445c5c3d  544b5345  512d504f  38565641    = \ \ D E S K T O P - Q A V V 8 
[7ffffdc0]    4c004b49  4c41434f  44505041  3d415441    I K . L O C A L A P P D A T A = 
[7ffffdd0]    555c3a43  73726573  7661445c  5c656469    C : \ U s e r s \ D a v i d e \ 
[7ffffde0]    44707041  5c617461  61636f4c  4f48006c    A p p D a t a \ L o c a l . H O 
[7ffffdf0]    4150454d  5c3d4854  72657355  61445c73    M E P A T H = \ U s e r s \ D a 
[7ffffe00]    65646976  4d4f4800  49524445  433d4556    v i d e . H O M E D R I V E = C 
[7ffffe10]    5046003a  52425f53  4553574f  53555f52    : . F P S _ B R O W S E R _ U S 
[7ffffe20]    505f5245  49464f52  535f454c  4e495254    E R _ P R O F I L E _ S T R I N 
[7ffffe30]    65443d47  6c756166  50460074  52425f53    G = D e f a u l t . F P S _ B R 
[7ffffe40]    4553574f  50415f52  52505f50  4c49464f    O W S E R _ A P P _ P R O F I L 
[7ffffe50]    54535f45  474e4952  746e493d  656e7265    E _ S T R I N G = I n t e r n e 
[7ffffe60]    78452074  726f6c70  44007265  65766972    t   E x p l o r e r . D r i v e 
[7ffffe70]    74614472  3a433d61  6e69575c  73776f64    r D a t a = C : \ W i n d o w s 
[7ffffe80]    7379535c  336d6574  72445c32  72657669    \ S y s t e m 3 2 \ D r i v e r 
[7ffffe90]    72445c73  72657669  61746144  6d6f4300    s \ D r i v e r D a t a . C o m 
[7ffffea0]    63657053  5c3a433d  646e6957  5c73776f    S p e c = C : \ W i n d o w s \ 
[7ffffeb0]    74737973  32336d65  646d635c  6578652e    s y s t e m 3 2 \ c m d . e x e 
[7ffffec0]    4d4f4300  45545550  4d414e52  45443d45    . C O M P U T E R N A M E = D E 
[7ffffed0]    4f544b53  41512d50  49385656  6f43004b    S K T O P - Q A V V 8 I K . C o 
[7ffffee0]    6e6f6d6d  676f7250  576d6172  32333436    m m o n P r o g r a m W 6 4 3 2 
[7ffffef0]    5c3a433d  676f7250  206d6172  656c6946    = C : \ P r o g r a m   F i l e 
[7fffff00]    6f435c73  6e6f6d6d  6c694620  43007365    s \ C o m m o n   F i l e s . C 
[7fffff10]    6f6d6d6f  6f72506e  6d617267  656c6946    o m m o n P r o g r a m F i l e 
[7fffff20]    38782873  433d2936  72505c3a  6172676f    s ( x 8 6 ) = C : \ P r o g r a 
[7fffff30]    6946206d  2073656c  36387828  6f435c29    m   F i l e s   ( x 8 6 ) \ C o 
[7fffff40]    6e6f6d6d  6c694620  43007365  6f6d6d6f    m m o n   F i l e s . C o m m o 
[7fffff50]    6f72506e  6d617267  656c6946  3a433d73    n P r o g r a m F i l e s = C : 
[7fffff60]    6f72505c  6d617267  6c694620  435c7365    \ P r o g r a m   F i l e s \ C 
[7fffff70]    6f6d6d6f  6946206e  0073656c  49747541    o m m o n   F i l e s . A u t I 
[7fffff80]    4c74736e  433d676f  72505c3a  6172676f    n s t L o g = C : \ P r o g r a 
[7fffff90]    7461446d  69535c61  6e656d65  75415c73    m D a t a \ S i e m e n s \ A u 
[7fffffa0]    616d6f74  6e6f6974  676f4c5c  656c6966    t o m a t i o n \ L o g f i l e 
[7fffffb0]    65535c73  5c707574  50504100  41544144    s \ S e t u p \ . A P P D A T A 
[7fffffc0]    5c3a433d  72657355  61445c73  65646976    = C : \ U s e r s \ D a v i d e 
[7fffffd0]    7070415c  61746144  616f525c  676e696d    \ A p p D a t a \ R o a m i n g 
[7fffffe0]    4c4c4100  52455355  4f525053  454c4946    . A L L U S E R S P R O F I L E 
[7ffffff0]    5c3a433d  676f7250  446d6172  00617461    = C : \ P r o g r a m D a t a . 


Kernel data segment [90000000]..[90010000]
[90000000]    78452020  74706563  206e6f69  636f2000        E x c e p t i o n   .   o c 
[90000010]    72727563  61206465  6920646e  726f6e67    c u r r e d   a n d   i g n o r 
[90000020]    000a6465  495b2020  7265746e  74707572    e d . .     [ I n t e r r u p t 
[90000030]    2000205d  4c545b20  20005d42  4c545b20    ]   .     [ T L B ] .     [ T L 
[90000040]    20005d42  4c545b20  20005d42  64415b20    B ] .     [ T L B ] .     [ A d 
[90000050]    73657264  72652073  20726f72  69206e69    d r e s s   e r r o r   i n   i 
[90000060]    2f74736e  61746164  74656620  205d6863    n s t / d a t a   f e t c h ]   
[90000070]    5b202000  72646441  20737365  6f727265    .     [ A d d r e s s   e r r o 
[90000080]    6e692072  6f747320  205d6572  5b202000    r   i n   s t o r e ]   .     [ 
[90000090]    20646142  74736e69  74637572  206e6f69    B a d   i n s t r u c t i o n   
[900000a0]    72646461  5d737365  20200020  6461425b    a d d r e s s ]   .     [ B a d 
[900000b0]    74616420  64612061  73657264  00205d73      d a t a   a d d r e s s ]   . 
[900000c0]    455b2020  726f7272  206e6920  63737973        [ E r r o r   i n   s y s c 
[900000d0]    5d6c6c61  20200020  6572425b  6f706b61    a l l ]   .     [ B r e a k p o 
[900000e0]    5d746e69  20200020  7365525b  65767265    i n t ]   .     [ R e s e r v e 
[900000f0]    6e692064  75727473  6f697463  00205d6e    d   i n s t r u c t i o n ]   . 
[90000100]    5b202000  74697241  74656d68  6f206369    .     [ A r i t h m e t i c   o 
[90000110]    66726576  5d776f6c  20200020  6172545b    v e r f l o w ]   .     [ T r a 
[90000120]    00205d70  5b202000  616f6c46  676e6974    p ]   . .     [ F l o a t i n g 
[90000130]    696f7020  205d746e  20000000  6f435b20      p o i n t ]   . . .     [ C o 
[90000140]    636f7270  005d3220  20000000  444d5b20    p r o c   2 ] . . . .     [ M D 
[90000150]    005d584d  575b2020  68637461  2020005d    M X ] .     [ W a t c h ] .     
[90000160]    63614d5b  656e6968  65686320  005d6b63    [ M a c h i n e   c h e c k ] . 
[90000170]    00000000  5b202000  68636143  00005d65    . . . . .     [ C a c h e ] . . 
[90000180]    90000024  90000033  9000003b  90000043    $ . . . 3 . . . ; . . . C . . . 
[90000190]    9000004b  90000071  9000008d  900000aa    K . . . q . . . . . . . . . . . 
[900001a0]    900000c0  900000d6  900000e6  90000100    . . . . . . . . . . . . . . . . 
[900001b0]    90000101  9000011a  90000124  90000125    . . . . . . . . $ . . . % . . . 
[900001c0]    90000139  9000013a  9000013b  90000148    9 . . . : . . . ; . . . H . . . 
[900001d0]    90000149  9000014a  9000014b  90000154    I . . . J . . . K . . . T . . . 
[900001e0]    9000015e  90000170  90000171  90000172    ^ . . . p . . . q . . . r . . . 
[900001f0]    90000173  90000174  90000175  9000017f    s . . . t . . . u . . . . . . . 
[90000200]..[9000ffff]  00000000


