float x = 320;
float y;
float easing = 0.005;
int ticks;
float angle;
ArrayList<enemy> enemies = new ArrayList <enemy>();

void setupe() {
  ticks = 0;
}


void drawe() {
enemies.add(new enemy(200, 20, 4, 30, 100));
enemies.add(new enemy(800, 20, 3, 30, 100));
  for (int i = 0; i < 2; i++){
    if (enemies.get(i).health > 0){
      enemies.get(i).update();
      enemies.get(i).enemyhit();
      enemies.get(i).health();
    }
  }
  ticks++;
  if (ticks > 80){
      ticks = 0;
    }
  
  
}

class enemy { 
  float xpos, ypos, speed, size, health, shield; 
  
  enemy (float x, float y, float s, float z, float h) {  
    xpos = x;
    ypos = y; 
    speed = s;
    health = h;
    size = z;
    
  }

  
  void update() { 
    if (ticks < 30){
      if (abs(xpos - player.x) > 2 || abs(ypos - player.y) > 2) {
        angle = atan2(player.y - ypos, player.x - xpos);
        xpos = xpos + round(speed * cos(angle));
        ypos = ypos + round(speed * sin(angle));
    }
    }
    
    ellipse(xpos, ypos, this.size, this.size);
    
  }
  
  void enemyhit() {
    for (int i = 0; i < player.numBullets; i++){
      if (player.bullets.get(i).x <= (this.xpos + this.size) && player.bullets.get(i).x >= (this.xpos - this.size) 
        && player.bullets.get(i).y <= (this.ypos + this.size) && player.bullets.get(i).y >= (this.ypos - this.size)){
          if (this.health > 0) this.health -= 5;
      }
    }
  }
  
  void health() {
     float h = this.health;
     text(h, this.xpos - this.size/1.5, this.ypos + this.size);
  }
  
}