// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  int particleColour = #ffffff; 

  ParticleSystem(PVector location) {
    origin = location;
    particles = new ArrayList<Particle>();
  }
  
  ParticleSystem(PVector location, int pColour) {
    origin = location;
    particles = new ArrayList<Particle>();
    this.particleColour = pColour; 
  }

  void addParticle() {
      particles.add(new Particle(origin, particleColour));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  void newOrigin(float x, float y){
    origin.x = x; 
    origin.y = y;
  }
}



// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  int colour; 

  Particle(PVector l, int c) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 100.0;
    colour = c;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(colour,lifespan*2.55);
    fill(colour,lifespan*2.55);
    ellipse(location.x,location.y,8,8);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}