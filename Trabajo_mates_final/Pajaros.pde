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
        }
        else {
          exit();
        }
      }
    }
  }
}
