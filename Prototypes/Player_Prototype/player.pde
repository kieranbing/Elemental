class Player{
  int x,y;
  float rotate = 0;
  int headDiameter = 20, ammoCount = 10; 
  PVector vec;
 // Bullet b = new Bullet();
  ArrayList<Bullet> bullets = new ArrayList <Bullet>();
  int numBullets = 0;
  
  public Player(int xPos, int yPos){
    x=xPos;
    y=yPos;
    vec = new PVector(x,y);
  }
  
  void display(){
    
    //b.display();
    
    rotate = atan2(y-mouseY,mouseX-x);
    
    textAlign(LEFT);
    text(degrees(rotate)+" - ("+(mouseX-x)+", "+(mouseY-y)+")",10,10);
    
    if (numBullets > 0){
    for (int i=0;i<bullets.size();i++){
      Bullet b = bullets.get(i);
      b.display();
    }
    }
    
    pushMatrix();
    translate(x,y);
    //rotate(radians(rotate));
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
    
    noFill();
    rect(x-50,y-(headDiameter+20), 100,10);
    fill(0,0,255);
    rect(x-50,y-(headDiameter+20),ammoCount*10,10);
    
    
    /*fill(0);
    ellipse((x-headDiameter/2)+tx,y+ty,8,8);
    ellipse((x+headDiameter/2)-tx,y-ty,8,8);
    //fill(0,0,155);
    noFill();
    stroke(1);
    ellipse(x,y,headDiameter,headDiameter);*/
  }
  
  void shoot(){
    if (ammoCount > 0){
      bullets.add(new Bullet(this.x, this.y));
    
      ammoCount--;
      numBullets++;
    }
  }
  
  /*void look(int xin, int yin){
    tx = ((float)Math.abs((xin-this.x) / Math.sqrt(pow(xin-this.x,2)+pow(yin-this.y,2))))*headDiameter;
    ty = ((float)Math.abs((yin-this.y) / Math.sqrt(pow(xin-this.x,2)+pow(yin-this.y,2))))*headDiameter/2;
  }*/
}