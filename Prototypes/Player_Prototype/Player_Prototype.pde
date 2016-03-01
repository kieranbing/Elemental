Player player;

boolean leftPressed = false, rightPressed = false, 
        upPressed = false, downPressed = false; 

void setup(){
  //size(768,769);
  //size(displayWidth,displayHeight);
  fullScreen(2); 
  smooth();
  player = new Player(width/2,height/2);
  //crosshair = new PVector(0,0);
}

void draw(){
  background(255); 
  player.display();
}

void mousePressed(){
  
  player.shoot(); //call shoot function
  
  
  /*
  player.b.x = player.x;
  player.b.y = player.y;
  
  player.b.setV();
  */
  
  //player.rotate = atan2(player.y-mouseY,player.x-mouseX);
 // player.rotate = atan2(player.y-mouseY,mouseX-player.x);
  
  //crosshair = new PVector(mouseX,mouseY);
  //player.rotate = PVector.angleBetween(player.vec,crosshair);
}

void keyPressed(){
  
  //Movement controls 
  if (key == 'a')
    leftPressed = true; 
  if (key == 'd')
    rightPressed = true; 
  if (key == 'w')
    upPressed = true; 
  if (key == 's')
    downPressed = true; 
  
  if (key == 'r'){
    player.reload(); 
  }
}

void keyReleased(){
  if (key == 'a')
    leftPressed = false; 
  if (key == 'd')
    rightPressed = false; 
  if (key == 'w')
    upPressed = false; 
  if (key == 's')
    downPressed = false;
}