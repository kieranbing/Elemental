Player player;

void setup(){
  size(768,769);
  smooth();
  player = new Player(width/2,height/2);
  //crosshair = new PVector(0,0);
}

void draw(){
  background(255); 
  player.display();
}

void mousePressed(){
  
  player.b.x = player.x;
  player.b.y = player.y;
  
  player.b.setV();
  
  //player.rotate = atan2(player.y-mouseY,player.x-mouseX);
 // player.rotate = atan2(player.y-mouseY,mouseX-player.x);
  
  //crosshair = new PVector(mouseX,mouseY);
  //player.rotate = PVector.angleBetween(player.vec,crosshair);
}