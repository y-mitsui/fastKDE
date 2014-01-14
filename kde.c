#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "fgt.h"


void kdeFree(kdeModelData *model){
	free_fgt(model);
}
kdeModelData *kdeFgtModel(double *samplingData,int num,int dimention,double bandwidth,int K){
	int p=10;
	double e=1000.0;
	int d=dimention;
	int i;

	if(K < 0) K=sqrt(num);
	
	bandwidth=sqrt(bandwidth);
	double *weight= malloc(num*sizeof(double));
	double w=1.0/sqrt(2.0*M_PI);
	for (i = 0 ; i < num ; i++){
		weight[i] = w;
	}
	fgtModelData* model=fgt_model(samplingData,weight ,bandwidth,p,K,e,d,num);
	free(weight);
	return model;
}
double *kdeFgtPredict(double *targets,int num,kdeModelData *model){
	int i;
	double *v=calloc(1,sizeof(double)*num);
	fgt_predict(targets ,num,v,model);
	register double bn=1/(model->Nx*model->sigma*model->sigma);
	for(i=0;i<num;i++) v[i]*=bn;
	return v;
}

