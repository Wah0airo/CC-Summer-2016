#compiling with gcc 
cprog:
	gcc -w -m32 -D'main(a, b)=main(int argc, char **argv)' selfie.c -o selfie

#compiling selfie for mipster and hypster
cself: cprog
	./selfie -c selfie.c -o selfie.m


#run mipster code cself 
mips: cself
	./selfie -l selfie.m -m 1

#true self compilation
self: cself
	./selfie -c selfie.c -o selfie1.m -m 2 -c selfie.c -o selfie2.m
	diff -s selfie1.m selfie2.m > diff.log
		

#cleans the executeable selfie file
clean:
	rm -f selfie


