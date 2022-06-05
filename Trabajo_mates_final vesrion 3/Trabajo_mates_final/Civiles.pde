
class civiles{
  
  PVector [] pos_c;
  color color_c;
  float size_c;
  
  civiles(color cc){
    pos_c =  new PVector[6];
    color_c = cc;
    for(int i=0;i<6;i++){
      pos_c[i] = new PVector(random(0.0, 800.0), random(0.0, 800.0));
    }
    color_c = color(189, 84, 18);
    size_c = 12.0;
  }
  
  void printCiviles(){
    for(int i=0;i<6;i++){
      fill(color_c);
      stroke(color_c);
      ellipse(pos_c[i].x, pos_c[i].y, size_c, size_c);
    }
  }
  
  void civilDamage() {

    for (int i=0; i<6; i++) {
      float vectorX = bullet.x - pos_c[i].x;
      float vectorY = bullet.y -pos_c[i].y;

      float modulo= sqrt(pow(vectorX, 2)+pow(vectorY, 2));
      fill(255);

      if (modulo<=(size_c + radiPJ)) { // Si se cumple hay colision
        // Mostramos un mensaje
        LUT_kill_enemy();
      }
    }
  }
  
  void civilColiPJ(PVector[] pos_c, float size_c) {
    for (int i=0; i<6; i++) {
      float vectorX = pos_c[i].x - PJTec.x;
      float vectorY = pos_c[i].y - PJTec.y;

      float modulo= sqrt(pow(vectorX, 2)+pow(vectorY, 2));

      if (modulo<=(size_c + size_c)) { // Si se cumple hay colision
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
