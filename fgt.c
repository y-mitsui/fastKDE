#include <math.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include "fgt.h"


void computeBuffer(double *prods,int *heads,double *dy,int p,int d);
double convolution(double *a,double *b,int n);

#ifndef max
    #define max(a,b) (a >= b ? a : b)
    #define min(a,b) (a <= b ? a : b)
#endif

/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
void fgt_predict(double *y ,int Ny, double *v , fgtModelData* model){

	double *A_k=model->A_k;
	double *xc=model->xc;
	double sigma=model->sigma;
	int K=model->K;
	double e=model->e;
	int d=model->d;
	int pd=model->pd;
	double *prods=model->prods;
	int *heads=model->heads;

	double *dy= (double *)calloc(1,d*sizeof(double));
	
	int p , i ,  m ,    mbase , kn , xbase , ind;
	double sum2 , ctesigma = 1.0/(sigma) , temp ;

	p              = invnchoosek(d , pd);


	for (m=0 ; m < Ny ; m++)
	{	
		temp    = 0.0;
		mbase   = m*d;
		
		for (kn = 0 ; kn < K ; kn++)
		{
			xbase = kn*d;
			ind   = kn*pd;
			sum2  = 0.0;
			for (i = 0 ; i < d ; i++)
			{
				dy[i]    = (y[i + mbase] - xc[i + xbase])*ctesigma;
				sum2    += dy[i] * dy[i];
				heads[i] = 0;
			}
			if (sum2 > e) continue; 

			prods[0] = exp(-1.0/2.0*sum2);
#ifdef ENABLE_ASM
			computeBuffer(prods,heads,dy,p,d);
			temp+=convolution(&A_k[ind],prods,pd);
#else
			double temp1;
			int head,tail,t,k,j;
			for (k=1, t=1, tail=1 ; k < p ; k++ , tail=t)
			{
				for (i = 0 ; i < d; i++)
				{
					head     = heads[i];
					heads[i] = t;
					temp1    = dy[i];
					for (j = head ; j < tail ; j++ , t++)
					{
						prods[t] = temp1 * prods[j];
					}
				} 
			}

			for (i = 0 ; i < pd ; i++)
			{
				temp += A_k[i + ind]*prods[i];
			}
#endif
		}
		v[m] = temp;
	}
	free(dy);
}	

/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
int invnchoosek(int d , int cnk)
{
	int i ,  cted=1 , ctep , cte , p ;	
	
	for(i = 2 ; i <= d ; i++)	
	{
		cted *=i;
	}
	cte  = cnk*cted;
	p    = 2;
	ctep = p;
	for (i = p + 1 ; i < p + d ; i++)
	{
		ctep *=i ; 	
	}
	while(ctep != cte)	
	{
		ctep = ((p+d)*ctep)/p;	
		p++;		
	}
	return p;
}
/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
fgtModelData* fgt_model(double *x , double *weight, double sigma , int p , int K , double e , int d , int Nx)
{
	
	int pd=nchoosek(p + d - 1 , d); 

	double *C_k=(double *)calloc(1,pd*sizeof(double));
	double *dist_C         = (double *)calloc(1,Nx*sizeof(double));
	
	double *prods= (double *)calloc(1,pd*sizeof(double));
	int *heads = (int *)calloc(1,(d + 1)*sizeof(int));
	double *dx             = (double *)calloc(1,d*sizeof(double));
	double *xc=calloc(1,sizeof(double)*d*K);
	double *A_k=calloc(1,sizeof(double)*pd*K);

	int *indxc          = (int *)calloc(1,K*sizeof(int));
	int *indx           = (int *)calloc(1,Nx*sizeof(int));
	//int *xhead          = (int *)calloc(1,K*sizeof(int));
	int *xboxsz         = (int *)calloc(1,K*sizeof(int));
	
	int *cinds          = (int *)calloc(1,pd*sizeof(int));
	

	Kcenter(x , d , Nx , K , xc , indxc , indx , xboxsz , dist_C);	
	Compute_C_k(d , p , C_k , heads , cinds);
	Compute_A_k(x , weight , xc , C_k , sigma , d , Nx , p , K , pd , A_k , indx  , dx , prods , heads );
	fgtModelData *result=malloc(sizeof(fgtModelData));

	result->prods=prods;
	result->heads=heads;
	result->dx=dx;
	result->A_k=A_k;
	result->xc=xc;
	result->sigma=sigma;
	result->pd=pd;
	result->K=K;
	result->e=e;
	result->d=d;
	result->Nx=Nx;

	free(C_k);
	free(dist_C);
	free(indxc);
	free(indx);
	free(xboxsz);
	free(cinds);
	return result;
}
void free_fgt(fgtModelData *model){
	free(model->prods);
	free(model->heads);
	free(model->dx);
	free(model->A_k);
	free(model->xc);
}

/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/

void Kcenter(double *x , int d , int Nx , int K , double *xc , int *indxc , int *indx , int *xboxsz , double *dist_C)
{	
	double *x_ind , *x_j;	
	register double temp ;
	int i , j , ind = 1, nd , ibase;
	
	*indxc++ = ind;
	x_j      = x;
	x_ind    = x + ind*d;
	
	for (j = 0 ; j < Nx ; x_j += d , j++)
	{	
		dist_C[j] = (j==ind) ? 0.0 : ddist(x_j , x_ind , d);	
		indx[j]   = 0;
	}
	
	for(i = 1 ; i < K ; i++)
	{	 
		ind      = idmax(dist_C , Nx);
		*indxc++ = ind; 
		x_j      = x;
		x_ind    = x + ind*d;
		
		for (j = 0 ; j < Nx ; x_j += d, j++)
		{
			temp = (j==ind) ? 0.0 : ddist(x_j , x_ind , d);
			if (temp < dist_C[j])
			{
				dist_C[j] = temp;
				indx[j]   = i;
			}
		}
	}
	
	for (i = 0 ; i < K ; i++)	
	{
		xboxsz[i] = 0;	
	}
	for (i = 0; i < d*K; i++)	
	{
		xc[i] = 0.0;	
	}

	for (i = 0 , nd = 0 ; i < Nx ; i++ , nd += d)
	{		
		xboxsz[indx[i]]++;	
		ibase = indx[i]*d;
		for (j = 0 ; j < d; j++)
		{
			xc[j + ibase ] += x[j + nd];	
		}
	}
	
	for (i = 0 , ibase = 0 ; i < K ; i++ , ibase += d)
	{	
		temp = (xboxsz[i]==0) ? 0.0 : 1.0/xboxsz[i];	
		for (j = 0; j < d; j++)
		{
			xc[j + ibase] *= temp;	
		}
	}	
}

/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
void Compute_C_k(int d , int p , double *C_k , int *heads , int *cinds)
{
    int i , k , t , j , tail , head;
		
	for (i = 0; i < d; i++)
	{	
		heads[i] = 0;	
	}
	
	heads[d] = INT_MAX;
	cinds[0] = 0;
	C_k[0]   = 1.0;
	
	for (k=1 , t=1, tail = 1 ; k < p ; k++ , tail=t)
	{
		for (i = 0; i < d; i++)
		{
			head     = heads[i];
			heads[i] = t;
			
			for ( j = head ; j < tail ; j++ , t++)
			{
				cinds[t] = (j < heads[i+1]) ? cinds[j] + 1 : 1;		
				C_k[t]   = 2.0 * C_k[j];
				C_k[t]  /= (double) cinds[t];
			}
		}
	}
}

/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/

void Compute_A_k(double *x , double *w , double *xc, double *C_k , double sigma , int d , int Nx , int p , int K , int pd , double *A_k , int *indx  , double *dx , double *prods , int *heads )
{
	int n , i , k , t , tail , j , head , ind;
	int nbase , ix2c , ix2cbase;	
	register double sum , ctesigma = 1.0/(sigma) , temp , temp1;
	
	for (i = 0; i < pd*K; i++)	
	{
		A_k[i] = 0.0;	
	}
	
	for (n = 0 ; n < Nx ; n++)
	{
		nbase    = n*d;
		ix2c     = indx[n];
		ix2cbase = ix2c*d;
		ind      = ix2c*pd;
        temp     = w[n];
		sum      = 0.0;
		
		for (i = 0 ; i < d ; i++)
		{
			dx[i]    = (x[i + nbase] - xc[i + ix2cbase])*ctesigma;	
			sum     += dx[i] * dx[i];
			heads[i] = 0;
		}
		
		prods[0] = exp(-1.0/2.0*sum);	
		for (k = 1 , t = 1 , tail = 1 ; k < p ; k++ , tail = t)
		{
			for (i = 0 ; i < d; i++)
			{
				head     = heads[i];		
				heads[i] = t;
				temp1    = dx[i];
				
				for ( j = head; j < tail ; j++, t++)
				{
					prods[t] = temp1 * prods[j];
				}
			} 
		}
		
		for (i = 0 ; i < pd ; i++)
		{
			A_k[i + ind] += temp*prods[i];	
		}
	}
	
	for (k = 0 ; k < K ; k++)
	{
		ind  = k*pd;
		for (i = 0 ; i < pd ; i++)
		{
			A_k[i + ind] *= C_k[i];
		}
	}
}

/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
int nchoosek(int n , int k)
{
	int i , n_k = n - k , nchsk = 1;
	
	if (k < n_k)
	{
		k   = n_k;		
		n_k = n - k;
	}
	for ( i = 1 ; i <= n_k ; i++)
	{
		nchsk *= (++k);
		nchsk /= i;
	}
	return nchsk;
}

/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
double ddist(double *x , double *y , int d)
{
	int i;	
	register double t , s = 0.0;
	
	for (i = 0 ; i < d ; i++)
	{
		t  = (x[i] - y[i]);	
		s += (t * t);
	}
	return s;
}

/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/

int idmax(double *x , int N)
{
	int i , k = 0;	
	double t = -1.0;
	
	for (i = 0 ; i < N ; i++ )
	{
		if( t < x[i] )
		{
			t = x[i];	
			k = i;
		}
	}
	return k;
}

/*----------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------*/
