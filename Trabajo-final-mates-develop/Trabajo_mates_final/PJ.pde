float radiPJ = 14;
float radiAim = 4;
float alfa = 0.25;
float PJsize;
PVector PJTec;
PVector PJ;
PVector aim;
PVector aimOnClick;
PVector bullet;
int lives = 3;
boolean shooting=false;

void setPJ(){
 PJ = new PVector(0.0, 0.0); 
 PJTec = new PVector(100.0, 720.0);
 aim = new PVector(mouseX, mouseY);
 aimOnClick = new PVector(0.0, 0.0);
 bullet = new PVector(PJTec.x, PJTec.y);
}

void PJ_movement(){
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      PJTec.y -= 8;
      PJ.y = -((1.0 - alfa) * width + alfa * PJ.x);
    bullet.x = (1.0 - alfa) * bullet.x + alfa * PJTec.x;//nueva x del PNJ
    bullet.y = (1.0 - alfa) * bullet.y + alfa * PJTec.y;//nueva y del PNJ
    } 
    else if (key == 'a' || key == 'A') {
      PJTec.x -= 8;
      PJ.x = -((1.0 - alfa) * width + alfa * PJ.x);
      bullet.x = (1.0 - alfa) * bullet.x + alfa * PJTec.x;//nueva x del PNJ
    bullet.y = (1.0 - alfa) * bullet.y + alfa * PJTec.y;//nueva y del PNJ
    } 
    else if (key == 'd' || key == 'D') {
      PJTec.x += 8;
      PJ.x = (1.0 - alfa) * width+ alfa * PJ.x;
      bullet.x = (1.0 - alfa) * bullet.x + alfa * PJTec.x;//nueva x del PNJ
    bullet.y = (1.0 - alfa) * bullet.y + alfa * PJTec.y;//nueva y del PNJ
    } 
    else if (key == 's' || key == 'S') {
      PJTec.y += 8;
      PJ.y = (1.0 - alfa) * width+ alfa * PJ.x;
      bullet.x = (1.0 - alfa) * bullet.x + alfa * PJTec.x;//nueva x del PNJ
    bullet.y = (1.0 - alfa) * bullet.y + alfa * PJTec.y;//nueva y del PNJ
    }
  }
  fill(130, 249, 30);
  stroke(70, 249, 13);
  ellipse(PJTec.x, PJTec.y, radiPJ, radiPJ);
}

void playerAim(){
  if (mousePressed && (mouseButton == LEFT)) {    
    stroke(0);
    fill(0);
  }
  //else if (mousePressed && (mouseButton == RIGHT)) {
    //fill(255);
  //} 
  else {
    stroke(255);
    fill(255);
  }
  ellipse(aim.x, aim.y, radiAim, radiAim);
}


void mouseClicked(){
 aimOnClick.x=mouseX;
 aimOnClick.y=mouseY;
}


void playerShoot(){
  /*PVector coliAim;
  coliAim = new PVector (0.0, 0.0);
  coliAim.x = aim.x - PJ.x;
  coliAim.y = aim.y - PJ.y;
  // Formula del modulo de un vector
  float modulo = sqrt(pow(coliAim.x, 2) + pow(coliAim.y, 2));*/
  
 
    shooting=true;
    //if( (key == 'f' || key == 'F')){
  if (mousePressed && (mouseButton == LEFT)) {
    mouseClicked();
    //formula de combinacion lineal o interpolacion 
    bullet.x = (1.0 - alfa) * bullet.x + alfa * aimOnClick.x;//nueva x del PNJ
    bullet.y = (1.0 - alfa) * bullet.y + alfa * aimOnClick.y;//nueva y del PNJ
     
  for(int i=0 ; i<6 ; i++){
    float vectorX=bullet.x-aimOnClick.x;
    float vectorY=bullet.y-aimOnClick.y;
    
    float modulo= sqrt(pow(vectorX,2)+pow(vectorY,2));
    fill(255);
      
    if(modulo<=(radiAim + radiAim)){ // Si se cumple hay colision
    // Mostramos un mensaje
     bullet = new PVector(PJTec.x, PJTec.y);

    text("SI HAY COLI",10,height-10);
    } 

   }
   aimOnClick = new PVector(0.0, 0.0);

  }
    
  stroke(192, 57, 43);
  fill(192, 57, 43);
  ellipse(bullet.x, bullet.y, radiAim, radiAim); 
  
}

void robotColi(PVector[] pos_r, float size_r){
   
  for(int i=0 ; i<6 ; i++){
    float vectorX=pos_r[i].x-PJTec.x;
    float vectorY=pos_r[i].y-PJTec.y;
    
    float modulo= sqrt(pow(vectorX,2)+pow(vectorY,2));
    fill(255);
      
    if(modulo<=(size_r + size_r)){ // Si se cumple hay colision
    // Mostramos un mensaje
    text("SI HAY COLI",10,height-10);
    } else{
    // Mostramos un mensaje
    text("NO HAY COLI",width-100,height-10);
    }

   }
 }
