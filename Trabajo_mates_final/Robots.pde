class robots{
  
  PVector [] pos_r;
  color color_r;
  float size_r;
  
  robots(color cr){
    pos_r =  new PVector[6];
    color_r = cr;
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
}
