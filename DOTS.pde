/**********************************************************************
*                                                                     *
*  Work in Progress: Ein Raster n*n wird gezeichnet und mit zufällig  *
*  gezeichneten Ellipsen gefüllt. Der Vorgang wird n Mal wiederholt   *
*  und die entstandenen Bilder gespeichert.                           *
*                                                                     *
*  Hommage to 700 DOTS by Jonathan Horowitz                           *
*                                                                     *
**********************************************************************/


int date = 180312;                                   //Datum (JJMMTT) und ID zur
int ID = 1;                                         //Sortierung der Ausgangsdateien

int frCo = 2;                                        //Anzahl Durchläufe = Ausgangsbilder

//-----------------------------------------------------------------

int n = 10;                                        //Anzahl Rasterzellen
int total = frCo * n * 10;                              //Zählt erschaffene DOTS
int [][] grid = new int [n][n];                    //  ??????????
int w = 1200, h = 1200;                             //Breite und Höhe des Canvas
int marg = 100;                                    //Randweite Canvas
float grThicc = 1.5;                                 //Breite Rasterlinien
float bCell;                                     //Maße Rasterzellen

float eW = (bCell+1)*random(50, 75);      //VERSUCH: variable ellipsenform
float eH = (bCell+1)*random(50, 75);
float x = 0;
float y = 0;

color colBG = color(255);                       // Hintergrundfarbe Raster
color colGR = color(0);                         // Farbe Rasterlinien
color colDOT = color(15);                      // Farbe Kreisform 

boolean saved = true;                          //Speichert Screenshots der Durchläufe

//-----------------------------------------------------------------

void settings()
{
  size(w, h);                                  // Bild-/ Canvasgröße
  smooth(4);                                  // 4x Antialiasing (sofern CPU unterstützt)
}

//-----------------------------------------------------------------

void setup()
{
  //noLoop();
  background(colBG);
  bCell = (w - 2*marg)/n;
  
  translate(marg, marg);                        //Konstruiert Raster ?????????
  float x = 0, y = 0;
  stroke(colGR);
  strokeWeight(grThicc);
  fill(colDOT);
  
  for (int i = 0; i<=n; i++) 
  {
    line(x, 0, x, height - 2*marg);
    line(0, y, width - 2*marg, y);
    x = x + bCell; y = y + bCell;
  }
}

//-----------------------------------------------------------------

void draw()
{
  translate(marg + bCell, marg + bCell);
  /**
 for (int i = 0; i<=n; i++) 
  {
    ellipse(i, i, eW, eH);

  } **/
  
  if(x < width)
  {
    if(y < height)
    {
      ellipse(x, y, 75, 75);
      y = y + 10;
    }
    x = x + 10;
  }
  
  
  //OBVIOUSLY COPIED until/incl. DOTS function:
  translate(marg, marg*2);
 
  /**
  for (int i = 0; i < n; i++)
  {
    for (int j = 0; j < n; j++)
    {
   
      //interpretiere den Wert von raster[i][j] als zufällig gewählten Balken!
      //Die Koordinaten der Balken werden zufällig an den Kanten der Zelle gewählt.
      //Bedeutung des Wertes von raster[i][j] zwischen 1 und 7 wie eingangs.
      ellipse(0, 0, 75, 75);
   
   //  DOTS(i, j, bCell);
   
   
   
   }
  }**/
    saveFrame(+date+"_DOTarray_"+ID+"##.png");       //Screenshot des Programmdurchlaufs mit steigender Nummer
     
     if (frameCount >= frCo)
  {
    println(+total+" DOTS saved to project folder. Reset ID to avoid overwriting.");
    System.exit(0);
  }
  
}

//-----------------------------------------------------------------
//Funktion zur Erstellung der DOTS mit zufälligen Radien (TBD)

/**void DOTS(, int i, int j, float cell)   
{
  float x = 0; float y= 0;
  ellipse(x+bCell, y+bCell, 25, 25);
  fill(colDOT);
   
}
**/
