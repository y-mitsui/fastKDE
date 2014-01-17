#include "fgt.h"

/*
[kdeFgtModel]
Make kdeModeling. You must call this before prediction.
samplingData: x. If d is dimention of x and n is number of x, Format of x is x_11, ..., x_1d,x_21,...,x_2d,...,x_nd .
num:Number of sampling data
dimention: Dimention of x
bandwidth: Bandwidth of KDE.
K: Count of caluclation.If this is large,caluclation is restrict.But it is waste time for caluclation.
   If K is nagative, K=sqrt(num).
result:model data for kdeFgtPredict().
*/
kdeModelData *kdeFgtModel(double *samplingData,int num,int dimention,double bandwidth,int K);
/*
[kdeFgtPredict]
Predict using kdeModelData.
target:value of prediction
num:number of target
model:KDE model which is maked by kdeFgtModel().
result:probability distribution of target.
*/
double *kdeFgtPredict(double *targets,int num,kdeModelData *model);
void kdeFree(kdeModelData *model);
