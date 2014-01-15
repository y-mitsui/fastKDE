#include <stdio.h>
#include "fdrand48.h"

#define PARAM_A0 ((unsigned long)0xe66d)
#define PARAM_A1 ((unsigned long)0xdeec)
#define PARAM_A2 ((unsigned long)0x5)
#define PARAM_C  ((unsigned long)0xb)

#define SCALE1 (1.0/65536.0/65536.0/65536.0)
#define SCALE2 (1.0/65536.0/65536.0)

#define LOWER(x) ((x) & 0xffff) /* lower bit of x */
#define UPPER(x) ((x) >> 16)	/* upper bit of x */
#define RANDBUFFER_SIZE 8

#ifdef __GNUC__
static unsigned short rand_param0[RANDBUFFER_SIZE]
	= {[RANDBUFFER_SIZE-1] = 0x330e};
static unsigned short rand_param1[RANDBUFFER_SIZE]
	= {[RANDBUFFER_SIZE-1] = 0xabcd};
static unsigned short rand_param2[RANDBUFFER_SIZE]
	= {[RANDBUFFER_SIZE-1] = 0x1234};
static int buffer_index = RANDBUFFER_SIZE;
#define CHECK_BUFFER if(buffer_index == RANDBUFFER_SIZE) gen_sequence()

#else

static unsigned short rand_param0[RANDBUFFER_SIZE];
static unsigned short rand_param1[RANDBUFFER_SIZE];
static unsigned short rand_param2[RANDBUFFER_SIZE];
static int buffer_index = RANDBUFFER_SIZE;
static int random_initialized_flag = 0;
#define CHECK_BUFFER						\
    if(random_initialized_flag == 0)				\
    {								\
        random_initialized_flag = 1;				\
        rand_param0[RANDBUFFER_SIZE-1] = 0x330e;		\
        rand_param1[RANDBUFFER_SIZE-1] = 0xabcd;		\
        rand_param2[RANDBUFFER_SIZE-1] = 0x1234;		\
        gen_sequence();						\
    } else if(buffer_index == RANDBUFFER_SIZE) gen_sequence()
#endif

static void gen_sequence(void)
{
    unsigned long p0, p1, p2;
    int i;


    p0 = (unsigned long)rand_param0[RANDBUFFER_SIZE - 1];
    p1 = (unsigned long)rand_param1[RANDBUFFER_SIZE - 1];
    p2 = (unsigned long)rand_param2[RANDBUFFER_SIZE - 1];

    for(i = 0; i < RANDBUFFER_SIZE; i++)
    {
	unsigned long p, w;

	w = PARAM_A0 * p0 + PARAM_C;
	p = p0;
	p0 = LOWER(w);

	w = UPPER(w) + PARAM_A2 * (p << 16)
                     + PARAM_A1 * (p  | (p1 << 16))
	             + PARAM_A0 * (p1 | (p2 << 16));

	rand_param0[i] = (unsigned short)p0;
	p1 = rand_param1[i] = (unsigned short)LOWER(w);
	p2 = rand_param2[i] = (unsigned short)UPPER(w);
    }

    buffer_index = 0;
}

double fdrand48(void)
{
    int index;

    CHECK_BUFFER;
    index = buffer_index++;

    return SCALE1 * rand_param0[index] +
	   SCALE2 * (((unsigned long)rand_param1[index])
		     | (((unsigned long)rand_param2[index])<<16));
}

void fsrand48(unsigned long seed)
{
    int index = RANDBUFFER_SIZE - 1;
    rand_param0[index] = 0x330e;
    rand_param1[index] = LOWER(seed);
    rand_param2[index] = UPPER(seed);
    buffer_index = RANDBUFFER_SIZE;

#ifndef __GNUC__
    random_initialized_flag = 1;
#endif
}

long flrand48(void)
{
    int index;

    CHECK_BUFFER;
    index = buffer_index++;

    return ((long)rand_param2[index] << 15) + ((long) rand_param1[index] >> 1);
}

long fmrand48(void)
{
    int index;

    CHECK_BUFFER;
    index = buffer_index++;

    return ((long)rand_param2[index] << 16) + ((long) rand_param1[index]);
}


#if CHECK
main()
{
    int i;
    extern double drand48();
    extern long lrand48(), mrand48();
    extern void srand48(unsigned long seed);

    fsrand48(123456789);
    srand48(123456789);

    printf("checking fdrand48()\n");
    for(i = 0; i < 10; i++)
	printf("%.20e %.20e\n", fdrand48(), drand48());
    printf("......");
    fflush(stdout);
    for(i = 0; i < 100000; i++)
	if(fdrand48() != drand48())
	{
	    fprintf(stderr, "ERROR\n");
	    goto test2;
	}
    printf("OK\n");

  test2:
    printf("\nchecking flrand48()\n");
    for(i = 0; i < 10; i++)
	printf("0x%08x 0x%08x\n", flrand48(), lrand48());
    printf("......");
    fflush(stdout);
    for(i = 0; i < 100000; i++)
	if(flrand48() != lrand48())
	{
	    fprintf(stderr, "ERROR\n");
	    goto test3;
	}
    printf("OK\n");

  test3:
    printf("\nchecking fmrand48()\n");
    for(i = 0; i < 10; i++)
	printf("0x%08x 0x%08x\n", fmrand48(), mrand48());
    printf("......");
    fflush(stdout);
    for(i = 0; i < 100000; i++)
	if(fmrand48() != mrand48())
	{
	    fprintf(stderr, "ERROR\n");
	    goto end;
	}
    printf("OK\n");

  end:

}
#elif BENCH

#define N 1000000
main()
{
    int i;
    int c;
    extern double drand48();
    extern long lrand48(), mrand48();
    extern void srand48(unsigned long seed);

    fsrand48(123456789);
    srand48(123456789);

    c = clock();
    for(i = 0; i < N; i++) drand48();
    printf("drand48(): %lf clock/call\n", (clock() - c) / (double)N);

    c = clock();
    for(i = 0; i < N; i++) lrand48();
    printf("lrand48(): %lf clock/call\n", (clock() - c) / (double)N);

    c = clock();
    for(i = 0; i < N; i++) mrand48();
    printf("mrand48(): %lf clock/call\n", (clock() - c) / (double)N);
    printf("\n");

    c = clock();
    for(i = 0; i < N; i++) fdrand48();
    printf("fdrand48(): %lf clock/call\n", (clock() - c) / (double)N);

    c = clock();
    for(i = 0; i < N; i++) flrand48();
    printf("flrand48(): %lf clock/call\n", (clock() - c) / (double)N);

    c = clock();
    for(i = 0; i < N; i++) fmrand48();
    printf("fmrand48(): %lf clock/call\n", (clock() - c) / (double)N);
    printf("\n");
}
#endif
