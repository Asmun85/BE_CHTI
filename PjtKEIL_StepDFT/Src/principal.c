

#include "DriverJeuLaser.h"

extern short int LeSignal[64];
int res;
int signal_rec[64];

int DFT_Signal(short int * Signal64tech, char k);
int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
CLOCK_Configure();
//signal_rec[1]= DFT_Signal(buff, 1);


	for(int k=0; k<64; k++){
	signal_rec[k] = DFT_Signal(LeSignal, k);
	res = signal_rec[k];
}




//============================================================================	
	
	
while	(1)
	{
	}
}

