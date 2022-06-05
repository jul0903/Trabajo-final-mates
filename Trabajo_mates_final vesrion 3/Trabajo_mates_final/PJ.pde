float radiPJ = 14;
float radiAim = 4;
float alfa = 0.25;
float PJsize;
PVector PJTec;
PVector PJ;
PVector aim;
PVector aimOnClick;
PVector bullet;
int lives;
int score;
boolean shooting = false;

void setPJ() {
  PJ = new PVector(0.0, 0.0); 
  PJTec = new PVector(100.0, 720.0);
  aim = new PVector(mouseX, mouseY);
  aimOnClick = new PVector(0.0, 0.0);
  bullet = new PVector(PJTec.x, PJTec.y);
}

void PJ_movement() {
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      PJTec.y -= 8;
      PJ.y = -((1.0 - alfa) * width + alfa * PJ.x);
      bullet.x = (1.0 - alfa) * bullet.x + alfa * PJTec.x;//nueva x del PNJ
      bullet.y = (1.0 - alfa) * bullet.y + alfa * PJTec.y;//nueva y del PNJ
    } else if (key == 'a' || key == 'A') {
      PJTec.x -= 8;
      PJ.x = -((1.0 - alfa) * width + alfa * PJ.x);
      bullet.x = (1.0 - alfa) * bullet.x + alfa * PJTec.x;//nueva x del PNJ
      bullet.y = (1.0 - alfa) * bullet.y + alfa * PJTec.y;//nueva y del PNJ
    } else if (key == 'd' || key == 'D') {
      PJTec.x += 8;
      PJ.x = (1.0 - alfa) * width+ alfa * PJ.x;
      bullet.x = (1.0 - alfa) * bullet.x + alfa * PJTec.x;//nueva x del PNJ
      bullet.y = (1.0 - alfa) * bullet.y + alfa * PJTec.y;//nueva y del PNJ
    } else if (key == 's' || key == 'S') {
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

void playerAim() {
  if (mousePressed && (mouseButton == LEFT)) {    
    stroke(0);
    fill(0);
  }
  stroke(255);
  fill(255);
    
  ellipse(aim.x, aim.y, radiAim, radiAim);
}

void mouseClicked() {
  aimOnClick.x=mouseX;
  aimOnClick.y=mouseY;
}

void playerShoot() {
  shooting=true;
  //if( (key == 'f' || key == 'F')){
  if (mousePressed && (mouseButton == LEFT)) {
    mouseClicked();
    //formula de combinacion lineal o interpolacion 
    bullet.x = (1.0 - alfa) * bullet.x + alfa * aimOnClick.x;//nueva x del PNJ
    bullet.y = (1.0 - alfa) * bullet.y + alfa * aimOnClick.y;//nueva y del PNJ

    for (int i=0; i<6; i++) {
      float vectorX=bullet.x-aimOnClick.x;
      float vectorY=bullet.y-aimOnClick.y;

      float modulo= sqrt(pow(vectorX, 2)+pow(vectorY, 2));
      fill(255);

      if (modulo<=(radiAim + radiAim)) { // Si se cumple hay colision
        // Mostramos un mensaje
        bullet = new PVector(PJTec.x, PJTec.y);
      }
    }
    aimOnClick = new PVector(0.0, 0.0);
  }
  stroke(112, 158, 160);
  fill(112, 158, 160);
  ellipse(bullet.x, bullet.y, radiAim, radiAim);
}

void PJLives() {
  if (lives == 3) {
    fill(0, 255, 0);
    rect(PJTec.x + 4, PJTec.y + 4, 10, 6 );
  } 
  else if (lives == 2) {
    fill(0, 255, 255);
    rect(PJTec.x + 4, PJTec.y + 4, 6, 6 );
  } 
  else if (lives == 1) {
    fill(255, 0, 0);
    rect(PJTec.x + 4, PJTec.y + 4, 3, 6 );
  }
  else{
    exit();
  }
}

void printLives() {
  textSize(15);

  if (lives == 3) {
    fill(0);
    text("LIVES: ", 30, height - 10);
    fill(0, 255, 0);
    text(lives, 75, height - 10);
  } 
  else if (lives == 2) {
    fill(0);
    text("LIVES: ", 30, height - 10);
    fill(0, 255, 255);
    text(lives, 75, height - 10);
  } 
  else if (lives == 1) {
    fill(0);
    text("LIVES: ", 30, height - 10);
    fill(255, 0, 0);
    text(lives, 75, height - 10);
  }
}
