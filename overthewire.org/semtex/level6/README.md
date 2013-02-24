Challenge page is <a href="http://www.overthewire.org/wargames/semtex/semtex6.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 6

ICMP forging
Send a special ICMP packet to an unknown host. Add the correct payload to it, to make sure you can receive the password. Spoof your origin address and make semtex believe, the packet is really coming from some government server (*.gov) Make sure this server you are sending from has a reverse DNS entry, otherwise you will not receive an answer.

You find more specific information in your home directory.
Reading Material
	- ICMP Request For Comment
	- Mixter's raw socket tutorial
Note:
	-You will have to use /rdx/rawwrapper. Take a look at the source

Code listing (semtex6.rawwrapper.c)

	 1 #ifndef _GNU_SOURCE
	 2 #define _GNU_SOURCE
	 3 #endif
	 4 #include <unistd.h> 
	 5 #include <stdio.h>
	 6 #include <stdlib.h>
	 7 #include <netinet/ip_icmp.h>
	 8 #include <string.h>
	 9 
	10 #define DROPUID 1009
	11 #define DROPGID 1009
	12 
	13 // rawwrapper, aton 2004
	14 
	15 int main(int argc, char *argv[])
	16 {
	17 	int rfd;
	18 	char *argv0, *argv1;
	19 		
	20 	if (argc<2)
	21 	{ 
	22 		printf("usage: rawwrapper <program>\n");
	23 		printf("argv[1] will be the raw socket\n");
	24 		exit(EXIT_FAILURE);
	25 	}
	26 	
	27 	//open raw socket
	28 	if ((rfd = socket(PF_INET, SOCK_RAW, IPPROTO_ICMP))<0)
	29 	{
	30 		perror("socket");
	31 		return EXIT_FAILURE;
	32 	}
	33 	
	34 	//drop priviledges
	35 	setresgid(DROPGID, DROPGID, DROPGID);
	36 	setresuid(DROPUID, DROPUID, DROPUID); 
	37 
	38 	argv0=malloc(strlen(argv[0])+1);
	39 	strcpy(argv0, argv[0]);
	40 	argv1=malloc(strlen(argv[1])+1);
	41 	strcpy(argv1, argv[1]);	
	42 	
	43 	// fill in new argv
	44 	argv[0]=argv1;
	45 	sprintf(argv[1], "%d", rfd);
	46 	
	47 	//execute the client program
	48 	execve(argv[0], argv, NULL);
	49 	return EXIT_SUCCESS;
	50 }

CHALLENGE_CONTENT

Comment by me:
	- The code will do as follow:
		- drop priviledge for user id 1009: group 1009 
		- create an ICMP socket
		- execute the program given in ARGV[1], and give the ICMP socket id as an argument for the program
			/rdx/rawwrapper program
		it then executes, (with priviledge)
			program [ICMP sock id]

	- Some problems from reading the code
		- I can't find userid:groupid == 1009:1009 in /etc/passwd
		- There is no path /rdx/rawwrapper
	- Although, there are files in /semtex/ directory
		---x------  1 root     root       12521 2011-11-13 23:08 semtex6*
		-r-s--x---  1 root     semtexraw   7521 2011-11-25 14:00 semtexraw*
		and with current user as
		uid=6006(semtex6) gid=6006(semtex6) groups=6006(semtex6),6999(semtexraw)
	- This could mean:
		- /rdx/rawwrapper is now /semtex/semtexraw
		- since EUID of the file is root, it can drop the priviledge of any user to the program

http://haifux.org/lectures/108/haifux-ping/haifux-ping-send-recv.c