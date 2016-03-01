class Ammo{
  ArrayList<Bullet> bullets;
}

class Bullet{
  float SPEED = 15; 
  
  float xVel = 0, yVel = 0;
  float x = width/2,y = height/2, oldx = 0, oldy = 0;
  float easing = 0.05;
  char element;
  
  Bullet(float x, float y, char e){
    this.x = x;
    this.y = y;
    this.xVel = setV(x,'x');
    this.yVel = setV(y,'y');
    
    this.element = e; 
    
    //this.xVel = xVel;
    //this.yVel = yVel;
  }
  
  void display(){
    x += this.SPEED * this.xVel;
    y += this.SPEED * this.yVel;
    
    //x = (1-easing) * oldx + easing * mouseX;
    //y = (1-easing) * oldy + easing * mouseY;
    
    switch(this.element){
      case 'e':
        fill(0,0,255);
        break;
      case 'f':
        fill(255,0,0);
        break;
      case 'g':
        fill(0,255,0);
        break;
      default:
        fill(0);
    }
    
    //fill(0,0,255);
    ellipse(x,y,5,5);
    
  //  textAlign(RIGHT);
//    text("TEST",width,20);
    
  //  oldx=x;
 //   oldy=y;
  }
  
  /*
  void setV(){
    //xVel = ((1-easing) * oldx + easing * mouseX);
    //yVel = ((1-easing) * oldy + easing * mouseY);
    
    xVel = (mouseX - x)/sqrt(pow(mouseX-x,2)+pow(mouseY-y,2));
    yVel = (mouseY - y)/sqrt(pow(mouseX-x,2)+pow(mouseY-y,2));
  }
  */
  
  float setV(float pos, char axis){
    //xVel = ((1-easing) * oldx + easing * mouseX);
    //yVel = ((1-easing) * oldy + easing * mouseY);
    switch(axis){
      case 'x':
        return (mouseX - pos)/sqrt(pow(mouseX-x,2)+pow(mouseY-y,2));
      case 'y':
        return (mouseY - pos)/sqrt(pow(mouseX-x,2)+pow(mouseY-y,2));
      default:
        return -1;
    }
    //return (mouseX - x)/sqrt(pow(mouseX-x,2)+pow(mouseY-y,2));
  }
}