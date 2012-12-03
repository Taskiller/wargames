//author: Anidear
//modified from: http://linuxgazette.net/81/sandeep.html

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <syscall.h>
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <errno.h>
#include <sys/reg.h> /* For constants ORIG_EAX etc */
#include <sys/user.h>

int main(void)
{
        long long counter = 0;  /*  machine instruction counter */
        int wait_val;           /*  child's return value        */
        int pid;                /*  child's process id          */
	long out;
	struct user_regs_struct regs;
	int eax, ebx, ecx, edx, esi, edi, esp, eip;

        puts("Please wait");

        switch (pid = fork()) {
        case -1:
                perror("fork");
                break;
        case 0: /*  child process starts        */
                ptrace(PTRACE_TRACEME, 0, 0, 0);
                /* 
                 *  must be called in order to allow the
                 *  control over the child process
                 */ 
                execl("/semtex/semtex4", "semtex4", NULL);
                /*
                 *  executes the program and causes
                 *  the child to stop and send a signal 
                 *  to the parent, the parent can now
                 *  switch to PTRACE_SINGLESTEP or PTRACE_SYSCALL
                 */ 
                break;
                /*  child process ends  */
        default:/*  parent process starts       */
		
                ptrace(PTRACE_SYSCALL, pid, 0, 0);
                wait(&wait_val); 
                /*   parent waits for child to stop at next system calls
                 */
                while (wait_val == 1407 ) {
                        counter++;
                        //if (ptrace(PTRACE_SINGLESTEP, pid, 0, 0) != 0)
                        //        perror("ptrace");
			out = ptrace(PTRACE_PEEKUSER, pid, 4*ORIG_EAX,0);
			printf("Sys call %ld\n",out);
			if(out==201){
				ptrace (PTRACE_GETREGS, pid, NULL, &regs);
				eax = regs.eax;
				ebx = regs.ebx;
				ecx = regs.ecx;
				edx = regs.edx;
				esi = regs.esi;
				edi = regs.edi;
				esp = regs.esp;
				eip = regs.eip;
				printf("EAX 0x%x EBX 0x%x ECX 0x%x EDX 0x%x ESI 0x%x EDI 0x%x ESP 0x%x EIP 0x%x\n", eax, ebx, ecx, edx, esi, edi, esp, eip);
				if(eax==0x1774){
					/* 0x1774==6004== id of user 'semtex4'
					 * need to change it to id user 'semtex5'
					 * id semtex5==6005==0x1775
					 */
					regs.eax = 0x1775;
					ptrace(PTRACE_SETREGS, pid, NULL, &regs);
				}
			}
			
                        ptrace(PTRACE_SYSCALL, pid, 0, 0);
			            /* restart child process, 
			             * but set to trigger when it does any system call
                         */
                        wait(&wait_val);
                        /*   wait for system call  */
                }
                /*
                 * continue to stop, wait and release until
                 * the child is finished; wait_val != 1407
                 * Low=0177L and High=05 (SIGTRAP)
                 */
        }
        printf("Number of system calls (entering+leaving) : %lld\n", counter);
        return 0;
}