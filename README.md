fastKDE
=======

C library of kernel density estimation which was optimized by the original fast Gauss transform and use Gaussian function .  
This library will significantly improve performance on KDE of Gaussian function.But if you require strict calculation, You should not use this library. Because there is tiny error at the fast Gauss transform.  
##Install  
(You require gmake and gcc.)  
1.If you execute with intel CPU and 32bit Linux, Code which was optimized by SSE2 is available by inputting this following.  
> export CFLAGS=-DENABLE_ASM  
(in case of bash)  
  
2.Input this following,  
> make  
  
3.Add "fgt.o","kde.o","kde.h" to your project.  
  
##Usage  
Read kde.h and example.c.  




