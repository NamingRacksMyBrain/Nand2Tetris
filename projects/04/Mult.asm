// Program: Mult.asm
// R2 = R0 * R1

// RAM[2] = 0;
// n = RAM[0];
// m = RAM[1];
// for (int i = 0; i < n; i++)
// {
//     RAM[2] += m;
// }

// Initialize n = RAM[0]
    @R0
    D=M
    @n
    M=D

// Initialize m = RAM[1]
    @R1
    D=M
    @m
    M=D

// Initialize i = 0
    @i
    M=0

// Initialize RAM[2] = 0
    @R2
    M=0

(loop)
    // if (i==n) goto END
    @i
    D=M
    @n
    D=D-M
    @END
    D;JEQ

    // RAM[2] += m
    @m
    D=M
    @R2
    M=D+M

    // i++
    @i
    M=M+1

    @loop
    0;JMP

(END)
    @END
    0;JMP

