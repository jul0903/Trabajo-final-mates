
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
    color_c = color(220, 118, 51);
    size_c = 12.0;
  }
  
  void printCiviles(){
    for(int i=0;i<6;i++){
      fill(color_c);
      stroke(color_c);
      ellipse(pos_c[i].x, pos_c[i].y, size_c, size_c);
    }
  }
}
