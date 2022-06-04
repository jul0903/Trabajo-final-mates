
civiles civil;
robots robot;
PVector [] pc = new PVector[6];

void setup(){
  size(800, 800);
  
  civil = new civiles(color(220, 118, 51));
  robot = new robots(color(220, 117, 50));
  
  setPJ();   
}

void draw() {
  background(128, 139, 150);
  
  aim.x = mouseX;
  aim.y = mouseY;
  
  stroke(255);
  fill(255);
  
  PJ_movement();
  playerAim();
  playerShoot();
  civil.printCiviles();
  robot.printRobots();
  
  //LUT_kill_enemy();
  if( (key == 'e' || key == 'E') && !mousePressed){
    push();
    LUT_calor();
    pop();
  }
}
