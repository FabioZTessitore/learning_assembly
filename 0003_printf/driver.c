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
 *
Dump of assembler code for function asm_main:
   0x565555d0 <+0>:   enter  0x0,0x0
=> 0x565555d4 <+4>:   pusha
   0x565555d5 <+5>:   push   0x56557008
   0x565555da <+10>:  call   0xf7e563c0 <puts>
   0x565555df <+15>:  pop    eax
   0x565555e0 <+16>:  popa
   0x565555e1 <+17>:  mov    eax,0x0
   0x565555e6 <+22>:  leave
   0x565555e7 <+23>:  ret
   0x565555e8 <+24>:  xchg   ax,ax
   0x565555ea <+26>:  xchg   ax,ax
   0x565555ec <+28>:  xchg   ax,ax
   0x565555ee <+30>:  xchg   ax,ax
End of assembler dump.
 *
 * x/13c 0x56557008
 *
0x56557008: 72 'H'  101 'e' 108 'l' 108 'l' 111 'o' 44 ','  32 ' '  87 'W'
0x56557010: 111 'o' 114 'r' 108 'l' 100 'd' 33 '!'
 *
 * (gdb) ni
 * (gdb) ni
 * (gdb) disassemble asm_main
 * (gdb) ni
 * (gdb) disassemble asm_main
 * (gdb) ni
 * (gdb) disassemble asm_main
 * (gdb) i r
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
