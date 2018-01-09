int winner;
int loser;
int clock;

typedef struct
{
    int row;
	int col;
	int size;
	int cdel;
	int speed;

	int anistate;
    int active;
    int index;
    int sprite;
    int aniCounter;
} PLAYER;











void initBonus();
void initQuadLeo();
void initRaceLeo();
void initSteve();
void drawBonus();
void drawQuadLeo();
void drawRaceLeo();
void drawSteve();
void updateBonus();
void updateQuadLeo();
void updateRaceLeo();
void updateSteve();