PVector[] punts_de_ctrl;
PVector[] coefs;
color color_punts;
color color_corba;
float tamany_punts;

class birds {

  PVector [] pos_b;
  color color_b;
  float size_b;

  birds(color cb) {
    pos_b =  new PVector[3];
    color_b = cb;
    for (int i=0; i<3; i++) {
      pos_b[i] = new PVector(random(0.0, 800.0), random(0.0, 800.0));
    }
    color_b = color(20, 90, 50);
    size_b = 10.0;
  }

  void printBirds() {
    for (int i=0; i<3; i++) {
      fill(color_b);
      stroke(color_b);
      ellipse(pos_b[i].x, pos_b[i].y, size_b, size_b);
    }
  }

  void birdDamage() {
    for (int i=0; i<3; i++) {
      float vectorX = bullet.x - pos_b[i].x;
      float vectorY = bullet.y - pos_b[i].y;

      float modulo= sqrt(pow(vectorX, 2)+pow(vectorY, 2));
      fill(255);

      if (modulo<=(size_b + radiPJ)) { // Si se cumple hay colision
        // Mostramos un mensaje
        LUT_kill_enemy();
      }
    }
  }

  void birdColiPJ(PVector[] pos_b, float size_b) {
    for (int i = 0; i < 3; i++) {
      float vectorX = PJTec.x - pos_b[i].x;
      float vectorY = PJTec.y - pos_b[i].y;

      float modulo= sqrt(pow(vectorX, 2)+pow(vectorY, 2));

      if (modulo<=(size_b + size_b)) { // Si se cumple hay colision
        // Mostramos un mensaje
        if (lives >= 1) {
          lives -= 1;
          PJTec.x = 100.0;
          PJTec.y = 720.0;
        } else {
          exit();
        }
      }
    }
  }

  //--------------------------------------------------------
  void setCurba() {
    // Constructor
    punts_de_ctrl = new PVector[4];
    coefs = new PVector[4];
    for (int i=0; i<4; i++) {
      punts_de_ctrl[0] = new PVector(100.0, 720.0);
      punts_de_ctrl[1] = new PVector(200.0, 600.0);
      punts_de_ctrl[2] = new PVector(300.0, 520.0);
      punts_de_ctrl[3] = new PVector(400.0, 400.0);

      coefs[i] = new PVector(0.0, 0.0);
      coefs[i].x = 0.0;
      coefs[i].y = 0.0;
    }
    tamany_punts = 5.0;
  }
  // Mètode
  void calcula_coefs() { 
    // C0 = P0
    // C1 = -5.5P0 + 9P1 - 4.5P2 + P3
    // C2 = 9P0 - 22.5P1 + 18P2 - 4.5P3
    // C3 = -4.5P0 + 13.5P1 - 13.5P2 + 4.5P3
    coefs[0].x = punts_de_ctrl[0].x;
    coefs[0].y = punts_de_ctrl[0].y;
    coefs[1].x = -5.5*punts_de_ctrl[0].x + 9 * punts_de_ctrl[1].x - 4.5 * punts_de_ctrl[2].x + punts_de_ctrl[3].x;
    coefs[1].y = -5.5*punts_de_ctrl[0].y + 9 * punts_de_ctrl[1].y - 4.5 * punts_de_ctrl[2].y + punts_de_ctrl[3].y;
    coefs[2].x = 9.0*punts_de_ctrl[0].x - 22.5 * punts_de_ctrl[1].x + 18.0 * punts_de_ctrl[2].x - 4.5 * punts_de_ctrl[3].x;
    coefs[2].y = 9.0*punts_de_ctrl[0].y - 22.5 * punts_de_ctrl[1].y + 18.0 * punts_de_ctrl[2].y - 4.5 *punts_de_ctrl[3].y;
    coefs[3].x = -4.5*punts_de_ctrl[0].x + 13.5 * punts_de_ctrl[1].x - 13.5 * punts_de_ctrl[2].x + 4.5 * punts_de_ctrl[3].x;
    coefs[3].y = -4.5*punts_de_ctrl[0].y + 13.5 * punts_de_ctrl[1].y - 13.5 * punts_de_ctrl[2].y + 4.5 * punts_de_ctrl[3].y;
  }

  void pinta_coefs() { // Es crida tots els cops que es vulgui
    strokeWeight(6);
    float x, y;

    // Primer pintem els punts de ctrl
    stroke(color_punts);
    for (int i = 0; i < 4; i++) {
      ellipse(punts_de_ctrl[i].x, punts_de_ctrl[i].y, tamany_punts, tamany_punts);
    }
    // Segon pintem la corba, es a dir els punts de la corba
    float alfa =  0.004;
    
    for(float u=0.0;u<1.0;u+=0.01){ // Pintar 100 punts
      // p(u) = C0 + C1 * u + C2 * u2 + C3 * u3 (GENERAL)
      // x(u) = C0x + C1x * u + C2x * u2 + C3x * u3
      // y(u) = C0y + C1y * u + C2y * u2 + C3y * u3
      x = coefs[0].x + coefs[1].x * u + coefs[2].x * u * u
      + coefs[3].x * u * u * u;
      y = coefs[0].y + coefs[1].y * u + coefs[2].y * u * u
      + coefs[3].y * u * u * u;
      point(x,y);
      
      for (int i = 0; i < 3; i++) {
        //Euler
        pos_b[i].x = (1.0 - alfa) * pos_b[i].x + alfa * coefs[i].x;
        pos_b[i].y = (1.0 - alfa) * pos_b[i].y + alfa * coefs[i].y;

        printBirds();
      }
    }
  }
}
