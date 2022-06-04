float radiPJ = 14;
float radiAim = 4;
float alfa = 0.3;
float PJsize;
PVector PJTec;
PVector PJ;
PVector aim;
PVector aimOnClick;
PVector bullet;
int lives = 3;

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
    } 
    else if (key == 'a' || key == 'A') {
      PJTec.x -= 8;
      PJ.x = -((1.0 - alfa) * width + alfa * PJ.x);
    } 
    else if (key == 'd' || key == 'D') {
      PJTec.x += 8;
      PJ.x = (1.0 - alfa) * width+ alfa * PJ.x;
    } 
    else if (key == 's' || key == 'S') {
      PJTec.y += 8;
      PJ.y = (1.0 - alfa) * width+ alfa * PJ.x;
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
  ellipse(aim.x, aim.y, 2, 2);
}

void playerShoot(){
  /*PVector coliAim;
  coliAim = new PVector (0.0, 0.0);
  coliAim.x = aim.x - PJ.x;
  coliAim.y = aim.y - PJ.y;
  
  // Formula del modulo de un vector
  float modulo = sqrt(pow(coliAim.x, 2) + pow(coliAim.y, 2));*/
  
  if (mousePressed && (mouseButton == LEFT)) {
    aimOnClick.x = aim.x;
    aimOnClick.y = aim.y;
    //formula de combinacion lineal o interpolacion 
    bullet.x = (1.0 - alfa) * bullet.x + alfa * aimOnClick.x;//nueva x del PNJ
    bullet.y = (1.0 - alfa) * bullet.y + alfa * aimOnClick.y;//nueva y del PNJ
  }
  
  stroke(192, 57, 43);
  fill(192, 57, 43);
  ellipse(bullet.x, bullet.y, radiAim, radiAim); 
  
  /*// Comparamos coli
  if(modulo <= (radiAim + radiPJ)){ // Si se cumple hay colision
    fill(255);
    text("SI HAY COLI",10,height-10);
    bullet.x = PJTec.x;
    bullet.y = PJTec.y;
  }*/
}
