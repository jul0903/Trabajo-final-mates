
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
  robotColi(robot.pos_r,robot.size_r);
  robot.robotDamage();
  robot.robotLives();
  coliPNJ();
  
  for(int i=0;i<6;i++){
      if(robot.size_r <= radiPJ){
        if(lives==3){
        lives=2;
        fill(0,255,0);
        rect(robot.pos_r[i].x, robot.pos_r[i].y, 3, 6);
        }
        else if(lives==2){
        lives=1;
        fill(0,255,255);
        rect(robot.pos_r[i].x, robot.pos_r[i].y, 3, 3);
        } 
      }  
   }
  
  //LUT_kill_enemy();
  if( (key == 'e' || key == 'E')){
    push();
    LUT_calor();
    pop();
  }
}

  
