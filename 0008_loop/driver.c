/* driver.c */

/* call an asm function */

int asm_main();

int main()
{
  int ret_status;

  ret_status = asm_main();

  return ret_status;
}
