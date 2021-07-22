// loop unrolling
#define N 10
int main(void){
    int c[((N)*(N))],a[N][N],b[N],i=0,j=0;
    for(i=0;i<N;i++)
    for(j=0;j<N;j++){
        c[i] = a[i][j]*b[i];
    }
}