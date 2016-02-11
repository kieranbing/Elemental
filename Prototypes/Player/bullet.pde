class Bullet{
  float xVel = 0, yVel = 0;
  float x = width/2,y = height/2, oldx = 0, oldy = 0;
  float easing = 0.05;
  void display(){
    x += 5*xVel;
    y += 5*yVel;
    
    //x = (1-easing) * oldx + easing * mouseX;
    //y = (1-easing) * oldy + easing * mouseY;
    
    fill(0,0.255);
    ellipse(x,y,5,5);
    
    
    textAlign(RIGHT);
    text("TEST",width,20);
    
    oldx=x;
    oldy=y;
  }
  
  void setV(){
    //xVel = ((1-easing) * oldx + easing * mouseX);
    //yVel = ((1-easing) * oldy + easing * mouseY);
    
    xVel = (mouseX - x)/sqrt(pow(mouseX-x,2)+pow(mouseY-y,2));
    yVel = (mouseY - y)/sqrt(pow(mouseX-x,2)+pow(mouseY-y,2));
  }
}