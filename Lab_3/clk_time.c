#include <time.h>
#include <stdio.h>


struct timespec diff(struct timespec start, struct timespec end);

long job_with_cpu_time(long execution_time)
{
  struct timespec time_start,time_end, time_begin_start;
  int exit=0;

  // Statements to create a job of duration execution_time given a argument ...
  long delta;

  clock_gettime(CLOCK_THREAD_CPUTIME_ID, &time_start);
  time_begin_start.tv_nsec = time_begin_start.tv_nsec;
  while (!exit) {

    clock_gettime(CLOCK_THREAD_CPUTIME_ID, &time_end);
    delta = diff(time_start, time_end).tv_nsec;

    if (delta > execution_time) {
      exit = 1;
    }}

      return (time_begin_start.tv_nsec - time_end.tv_nsec);
    // If you wish, you can print the time (in ns) elapsed between time_start
  // and time_end using the function diff below ...
}


long job_with_cpu_time_returned(long execution_time)
{
  struct timespec time_start, time_end;
  int exit=0;
  
  // Statements to create a job of duration execution_time given a argument ...
  

  // If you wish, you can print the time (in ns) elapsed between time_start
  // and time_end using the function diff below ...
  
  // Return the measured time in ns ...
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
