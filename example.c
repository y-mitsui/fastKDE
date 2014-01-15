#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "kde.h"
#include "fdrand48.h"

int min(int a,int b){
	return (a < b) ? a : b;
}
double kernel(double x){
	double n=1.0/sqrt(2.0*M_PI);
	const static double m=-1.0/2.0;
	return n*exp(m*x);
}
double *direct(double *sample,int num,int dimention,double *targets,double bandwidth,int numTargets){
	double sum,norm;
	int i,j,n;
	double *v=malloc(sizeof(double)*numTargets);

	for(j=0;j<numTargets;j++){
		sum=0.0;
		for(i=0;i<num;i++){
			norm=0.0;
			for(n=0;n<dimention;n++){
				norm+=pow((sample[i*dimention+n]-targets[j*dimention+n])/bandwidth,2);
			}
			sum+=kernel(norm);
		}
		v[j]=1/(num*bandwidth)*sum;
	}
	return v;
}
/* 
  nrand() :  a random sample from standard normal distribution  
 */
double nrand()
{
        static int sw=0;
        static double r1,r2,s;

        if (sw==0){
                sw=1;
                do {
                        r1=2.0*fdrand48()-1.0;
                        r2=2.0*fdrand48()-1.0;
                        s=r1*r1+r2*r2;
                } while (s>1.0 || s==0.0);
                        s=sqrt(-2.0*log(s)/s);
                        return(r1*s);
        }
        else {
                sw=0;
                return(r2*s);
        }
}


int main(void){
	double *source,*target;
	int sizeSource=1000;
	int sizeTarget=100;
	int i,dimention,j;
	double bandwidth=0.96;
	clock_t time,orijinal;

	dimention=1;
	source=malloc(sizeof(double)*sizeSource*dimention);
	for(i=0;i<sizeSource;i++){
		for(j=0;j<dimention;j++){
			source[i*dimention+j]=nrand();
		}
	}

	target=malloc(sizeof(double)*sizeTarget*dimention);
	for(i=0;i<sizeTarget;i++){
		for(j=0;j<dimention;j++){
			target[i*dimention+j]=(double)i/((double)sizeTarget/2.0)-1.0;
		}
	}

	time=clock();
	double *orijinalValue=direct(source,sizeSource,dimention,target,bandwidth,sizeTarget);
	orijinal=clock() - time;
	
	time=clock();
	kdeModelData *model=kdeFgtModel(source,sizeSource,dimention,bandwidth,10);
	double *value=kdeFgtPredict(target,sizeTarget,model);

	printf("direct time:%.5fsec optimized time:%.5fsec\n",(double)orijinal/(double)CLOCKS_PER_SEC ,(double)(clock() - time) / (double)CLOCKS_PER_SEC);

	int countUp=(20 > sizeTarget) ? 1 : sizeTarget/20;
	for(i=0;i<sizeTarget;i+=countUp){
		printf("directValue[%05d]:%lf\toptimizedValue[%05d]:%lf\n",i,orijinalValue[i],i,value[i]);
	}
	free(source);
	free(target);
	free(value);
	free(orijinalValue);
	kdeFree(model);
	return 1;
}
