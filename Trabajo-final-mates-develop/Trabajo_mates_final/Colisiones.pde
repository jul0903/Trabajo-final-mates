void coliPNJ(){
  for (int i = 0; i < 6; i++) {
    //En aquest cas no hi ha persecucció, per tant és igual si poso primer el PJ o el PNJ
    PJ.x = PJ.x - aim.x;
    PJ.y = PJ.y - aim.y;
    
    //Formula del modulo de un vector en R2
    
    float modulo = sqrt(pow(PJ.x, 2) + pow(PJ.y, 2));
    //Comparamos
    if (modulo <= radiPJ) { //Si se cumple, hay colision
      //Mostramos un mensaje
      fill(255, 35, 198);
      text("-10 of life", 100, height - 100);
    } 
  }
}
