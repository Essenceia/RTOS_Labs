#include <time.h>
#include <stdio.h>


struct timespec diff(struct timespec start, struct timespec end);

long job_with_cpu_time(long execution_time)
{
  struct timespec time_start,time_end;
  int exit=0;

  // Statements to create a job of duration execution_time given a argument ...
  long delta;

  clock_gettime(CLOCK_THREAD_CPUTIME_ID, &time_start);
  while (!exit) {

    clock_gettime(CLOCK_THREAD_CPUTIME_ID, &time_end);
    delta = diff(time_start, time_end).tv_nsec;

    if (delta > execution_time) {
      exit = 1;
    }}
    
    printf("exepected execution time : %d actual %d ",execution_time,delta); 
    delta = delta / 1000000;  
    return delta;
    // If you wish, you can print the time (in ns) elapsed between time_start
  // and time_end using the function diff below ...
}

void print_values(long i1){
	printf("value : %d\n", i1);
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
