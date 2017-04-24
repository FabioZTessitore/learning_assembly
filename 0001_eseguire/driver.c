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
 */

int asm_main();

int main()
{
  int ret_status;

  ret_status = asm_main();

  return ret_status;
}
