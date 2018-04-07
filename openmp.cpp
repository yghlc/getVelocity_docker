#include <stdio.h> 
#include <cmath>
  int main()
  {
    const int size = 256*10000;
    //double sinTable[size];
    
    #pragma omp parallel for
    for(int n=0; n<size; ++n)
    {
      
// sinTable[n] = std::sin(2 * M_PI * n / size);
   for (int j=0;j<size;j++)
{
	int out=1.0*20*12;
}
     printf("%d\n",n);  
    }
    // the table is now initialized
  }
