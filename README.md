fastKDE
=======

Kernel density estimation library which was optimized by the fast Gauss transform in C.  
This library will significantly improve performance about KDE.But if you require strict calculation, You should not use this library. Because there is tiny error at the fast Gauss transform.  
##Install  
(You require gmake and gcc.)  
1. Enter this follow,
> make  

2. Add "fgt.o","kde.o","kde.h" to your project.  

##Usage  
Read kde.h and example.c.  




