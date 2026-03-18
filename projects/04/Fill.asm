// Program: Fill.asm
// Usage: if pressed -> black
//              else -> white

// n = 8192
@8192
D=A
@n
M=D

(LOOP) 
    // Initialize i = 0
    @i
    M=0  
    
    @KBD
    D=M  
    @WHITE
    D;JEQ  // if RAM[KBD] = 0: goto WHITE
    @BLACK
    0;JMP  // else: goto BLACK

(BLACK)
    @color
    M=-1
    
    // goto DRAW
    @DRAW
    0;JMP

(WHITE)
    @color
    M=0
    
(DRAW)    
    // addr = SCREEN + i
    @i
    D=M
    @SCREEN
    D=D+A       
    @addr
    M=D

    // RAM[addr] = RAM[color]
    @color
    D=M
    @addr
    A=M
    M=D

    // i++
    @i
    M=M+1
    D=M

    // if (i=n) goto LOOP
    @n
    D=D-M
    @LOOP
    D;JEQ

    // else goto DRAW
    @DRAW
    0;JMP
