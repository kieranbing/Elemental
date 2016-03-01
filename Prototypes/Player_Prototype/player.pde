class Player{
  //Constants
  final float MAXSPEED = 4; 
  
  //Variables
  int x,y;
  float rotate = 0, xSpeed = 0, ySpeed = 0;
  int headDiameter = 20, ammoCount = 10, numBullets = 0; 
  PVector vec;
 // Bullet b = new Bullet();
  ArrayList<Bullet> bullets = new ArrayList <Bullet>();
  
  public Player(int xPos, int yPos){
    x=xPos;
    y=yPos;
    vec = new PVector(x,y);
  }
  
  void display(){ 
    
    rotate = atan2(y-mouseY,mouseX-x);
    
    textAlign(LEFT);
    text(degrees(rotate)+" - ("+(mouseX-x)+", "+(mouseY-y)+")",10,10);
    
    if (numBullets > 0){
      for (int i=0;i<bullets.size();i++){
        Bullet b = bullets.get(i);
        b.display();
      }
    }
    
    move();
    
    pushMatrix();
    translate(x,y);
    rotate(-(rotate-radians(90)));
    
    fill(0);
    rect(0,-50,1,40);
    ellipse((headDiameter/2),0,8,8);
    ellipse((-headDiameter/2),0,8,8);
    //fill(0,0,155);
    noFill();
    stroke(1);
    ellipse(0,0,headDiameter,headDiameter);
    
    popMatrix();
    
    //arc(x,y,100,100,(rotate>0?-rotate:-PI-(PI+rotate)),0/*(rotate<0?-rotate:0)*/);
    
    
    //UI display code (should probably be it's own object)
    noFill();
    //rect(x-50,y-(headDiameter+20), 100,10);
    rect(10, height-20, 100, 10);
    fill(0,0,255);
    //rect(x-50,y-(headDiameter+20),ammoCount*10,10);
    rect(10,height-20,ammoCount*10,10);
    
  }
  
  void shoot(){
    if (ammoCount > 0){
      bullets.add(new Bullet(this.x, this.y, 'e'));
    
      ammoCount--;
      numBullets++;
    }
  }
  
  void reload(){
    this.ammoCount = 10; 
  }
  
  void move(){
    //Handle movement on X-Axis
    if (leftPressed == true && xSpeed >= -MAXSPEED)
      xSpeed -= 0.75;
         
    if (rightPressed == true && xSpeed <= MAXSPEED)
      xSpeed += 0.75; 
         
    if (leftPressed == rightPressed)
      if (xSpeed > 0.25)
        xSpeed = xSpeed/2;
      else 
        xSpeed = 0;  
        
        
    //Handle movement on Y-Axis
    if (upPressed == true && ySpeed >= -MAXSPEED)
      ySpeed -= 0.75;
         
    if (downPressed == true && ySpeed <= MAXSPEED)
      ySpeed += 0.75; 
         
    if (upPressed == downPressed)
      if (ySpeed > 0.25)
        ySpeed = ySpeed/2;
      else 
        ySpeed = 0;  
        
    this.x += xSpeed; 
    this.y += ySpeed; 
  }
  
}