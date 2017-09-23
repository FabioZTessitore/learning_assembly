/* driver.c */

/* call an asm function */

/* debug:
 *
 * $ gdb driver
 *
 * (gdb) set disassembly-flavor intel
 * (gdb) break asm_main
 * (gdb) run
 * (gdb) disassemble asm_main
Dump of assembler code for function asm_main:
   0x56555610 <+0>:   enter  0x0,0x0
=> 0x56555614 <+4>:   pusha
   0x56555615 <+5>:   mov    DWORD PTR ds:0x56557020,0x7
   0x5655561f <+15>:  push   0x56557008
   0x56555624 <+20>:  call   0xf7e3ff70 <printf>
   0x56555629 <+25>:  pop    eax
   0x5655562a <+26>:  push   DWORD PTR ds:0x56557020
   0x56555630 <+32>:  push   0x56557017
   0x56555635 <+37>:  call   0xf7e3ff70 <printf>
   0x5655563a <+42>:  add    esp,0x8
   0x5655563d <+45>:  push   0x5655701a
   0x56555642 <+50>:  call   0xf7e3ff70 <printf>
   0x56555647 <+55>:  pop    eax
   0x56555648 <+56>:  popa
   0x56555649 <+57>:  mov    eax,0x0
   0x5655564e <+62>:  leave
   0x5655564f <+63>:  ret
End of assembler dump.
* (gdb) ni
* (gdb) ni
* (gdb) disassemble asm_main
* (gdb) x/x 0x56557020
0x56557020: 0x00000007
* (gdb) ni
* (gdb) disassemble asm_main
* (gdb) x/x $esp
0xffffd0b4: 0x56557008
* (gdb) cont
* (gdb) quit
 */

int asm_main();

int main()
{
  int ret_status;

  ret_status = asm_main();

  return ret_status;
}
