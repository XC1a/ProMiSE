#include <stdlib.h>
#include <stdio.h>



static const int m1rnd=30269;
static const int m2rnd=30307;
static const int m3rnd=30323;
static const float invm1rnd=1.0f/m1rnd;
static const float invm2rnd=1.0f/m2rnd;
static const float invm3rnd=1.0f/m3rnd;
static const int k1rnd=171;
static const int k2rnd=172;
static const int k3rnd=170;

static int y1rnd=1023;
static int y2rnd=11;
static int y3rnd=3007;

float myrandom()
{
  float x1,x2,x3;

  y1rnd=(k1rnd*y1rnd) % m1rnd;
  y2rnd=(k2rnd*y2rnd) % m2rnd;
  y3rnd=(k3rnd*y3rnd) % m3rnd;

  x1=(float)y1rnd;
 	x1*=invm1rnd;

  x2=(float)y2rnd;
 	x2*=invm2rnd;

  x3=(float)y3rnd;
 	x3*=invm3rnd;

#if !defined(SPEC_CPU_WINDOWS)
  return (x1+x2+x3)-int32_t(x1+x2+x3);
#else
  return (x1+x2+x3)-__int32(x1+x2+x3);
#endif /* !SPEC_CPU_WINDOWS */
}

int myrandom_1(int a, int b)
{
  return (int)((b-a+1)*myrandom())+b;
}

int main(){
    int i =0;
    for (i = 0; i < 20; i++)
    {
      printf("random : %.17f\n",myrandom());
    }
    for (i = 0; i < 20; i++)
    {
      printf("random : %.17f\n",myrandom_1(i,20));
    }
    return 0;
}
