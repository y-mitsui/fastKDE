typedef struct{
	double *prods;
	int *heads;
	double *dx;
	double *A_k;
	double *xc;
	double sigma;
	int pd;
	int K;
	double e;
	int d;
	int Nx;
	
}fgtModelData;
typedef fgtModelData kdeModelData;


int invnchoosek(int , int );
void fgt_predict(double *y ,int Ny, double *v , fgtModelData* model);


int nchoosek(int  , int );
int idmax(double * , int );
double ddist(double * , double * , int );
void Kcenter(double * , int  , int  , int , double * , int * , int * , int * , double *);
void Compute_C_k(int  , int , double * , int * , int *);
void Compute_A_k(double * , double * , double *, double *  , double  , int , int  , int , int , int , double * , int * , double * , double * , int * );
fgtModelData* fgt_model(double *x , double *weight, double sigma , int p , int K , double e , int d , int Nx);

void gftPredictASM(double *v,double *target,double *xCenter,int num,int dimention,int k);
void free_fgt(fgtModelData *model);
