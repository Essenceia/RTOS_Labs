#include <time.h>
#include <stdio.h>
#include <bcm2835.h>

struct timespec diff(struct timespec start, struct timespec end);


void job_with_cpu_time(long execution_time)
{
  struct timespec time_start, time_end;
  int exit=0;
  long delta;
  clock_gettime(CLOCK_THREAD_CPUTIME_ID, &time_start);
// printf("hello 1 "); 
  // Statements to create a job of duration execution_time given a argument ...
  while(!exit){
  clock_gettime(CLOCK_THREAD_CPUTIME_ID, &time_end);
// printf("hello 2 ");
  delta = diff(time_start, time_end).tv_nsec ;
//	printf("time has elapsed delat %ld \n, exectution time %ld \n",delta,execution_time );
	  if(delta > execution_time){
  exit = 1;
  }
	  //do the blink
	  
//  else printf("current time  %ld \n", time_start.tv_nsec);//yay R values
  }

  // If you wish, you can print the time (in ns) elapsed between time_start
  // and time_end using the function diff below ...
//  printf("execution time delta :: %ld\n", delta );
}

struct timespec diff(struct timespec start, struct timespec end)
{
  struct timespec temp;
  if ((end.tv_nsec-start.tv_nsec)<0) {
    temp.tv_sec = end.tv_sec-start.tv_sec-1;
    temp.tv_nsec = 1000000000+end.tv_nsec-start.tv_nsec;
  } else {
    temp.tv_sec = end.tv_sec-start.tv_sec;
    temp.tv_nsec = end.tv_nsec-start.tv_nsec;
  }
  return temp;
}
