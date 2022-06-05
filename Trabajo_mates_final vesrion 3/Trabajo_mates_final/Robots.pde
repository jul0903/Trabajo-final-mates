class robots {

  PVector [] pos_r;
  color color_r;
  float size_r;

  robots(color cr) {
    pos_r =  new PVector[6];
    color_r = cr;
    for (int i=0; i<6; i++) {
      pos_r[i] = new PVector(random(0.0, 800.0), random(0.0, 800.0));
    }
    color_r = color(189, 86, 20);
    size_r = 12.0;
  }

  void printRobots() { // Arreglar desaparecer cuando matas
  int posColi=0;
    for (int i=0; i < 6; i++) {
      if(i != robotDamage(posColi)) {
      fill(color_r);
      stroke(color_r);
      ellipse(pos_r[i].x, pos_r[i].y, size_r, size_r);
      }
    }
  }

  int robotDamage(int pos) {
    int i = 0;
    for (; i < 6; i++) {
      float vectorX = bullet.x - pos_r[i].x;
      float vectorY = bullet.y - pos_r[i].y;

      float modulo= sqrt(pow(vectorX, 2)+pow(vectorY, 2));
      fill(255);

      if (modulo<=(size_r + radiPJ)) { // Si se cumple hay colision
        // Mostramos un mensaje
        LUT_kill_enemy();
        return i;
      }
    }
    return i;
  }
  

  void robotColiPJ(PVector[] pos_r, float size_r) {
    for (int i=0; i<6; i++) {
      float vectorX = pos_r[i].x - PJTec.x;
      float vectorY = pos_r[i].y - PJTec.y;

      float modulo= sqrt(pow(vectorX, 2)+pow(vectorY, 2));

      if (modulo <= (size_r + size_r)) { // Si se cumple hay colision
        // Mostramos un mensaje
        if (lives >= 1) {
          lives -= 1;
          PJTec.x = 100.0;
          PJTec.y = 720.0;
        }
      }
    }
  }
}
