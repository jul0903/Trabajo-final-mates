
civiles civil;
robots robot;
birds bird;
PVector [] pc = new PVector[6];

void setup(){
  size(800, 800);
  
  civil = new civiles(color(220, 118, 51));
  robot = new robots(color(220, 117, 50));
  bird = new birds(color(20, 90, 50));
  
  setPJ();  
  lives = 3;
}

void draw() {
  background(245, 238, 248);
  
  aim.x = mouseX;
  aim.y = mouseY;
  
  stroke(255);
  fill(255);
  
  PJ_movement();
  playerAim();
  playerShoot();
  PJLives();
  civil.printCiviles();
  civil.civilColiPJ(civil.pos_c, civil.size_c);
  civil.civilDamage();
  bird.printBirds();
  bird.birdColiPJ(bird.pos_b, bird.size_b);
  bird.birdDamage();
  robot.printRobots();
  robot.robotColiPJ(robot.pos_r,robot.size_r);
  
  //LUT_kill_enemy();
  if( (key == 'e' || key == 'E')){
    push();
    LUT_calor();
    pop();
  }
  
  printLives();
}

  
