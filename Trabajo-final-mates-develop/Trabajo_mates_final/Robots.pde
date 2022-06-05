class robots{
  
  PVector [] pos_r;
  color color_r;
  float size_r;
  int lives;
  
  robots(color cr){
    pos_r =  new PVector[6];
    color_r = cr;
    lives=20;
    for(int i=0;i<6;i++){
      pos_r[i] = new PVector(random(0.0, 800.0), random(0.0, 800.0));
    }
    color_r = color(189, 86, 20);
    size_r = 12.0;
  }
  
  void printRobots(){
    for(int i=0;i<6;i++){
      fill(color_r);
      stroke(color_r);
      ellipse(pos_r[i].x, pos_r[i].y, size_r, size_r);
    }
  }
  
  
  void robotDamage(){
    
   for(int i=0 ; i<6 ; i++){
    float vectorX=bullet.x - pos_r[i].x;
    float vectorY=bullet.y -pos_r[i].y;
    
    float modulo= sqrt(pow(vectorX,2)+pow(vectorY,2));
    fill(255);
      
    if(modulo<=(size_r + size_r)){ // Si se cumple hay colision
    // Mostramos un mensaje
    lives--;
    LUT_kill_enemy();
    }
   }
  }
  
  void robotLives(){
  for(int i=0; i<6;i++){
   if(lives==20){
   fill(0,255,0);
   rect(pos_r[i].x + 4, pos_r[i].y + 4, 10, 6 );
   }
   else if(lives==10){
   fill(0,255,255);
   rect(pos_r[i].x + 4, pos_r[i].y + 4, 6, 6 );
   }
   else if(lives == 5){
   fill(255,0,0);
   rect(pos_r[i].x + 4, pos_r[i].y + 4, 3, 6 );
   }
    }
  
  }
}
