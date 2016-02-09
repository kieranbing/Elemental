/**
  * Intro Screen prototype
  * Developers:
  *  Kieran Bingham - main contributor to this protype
  *  Daniel Chen
  *  Ibrahim Bdira
 */


//Constants
static final int MAIN_MENU = 0; 
static final int PLAYING = 1;
static final int CREDITS = 2;
static final int QUIT = 3;
static final int NUMMENUBUTTONS = 3;


//Declaire resources & objects
PImage titleImg;
PImage electricIcon;
PImage fireIcon;
PImage stoneIcon;
PImage labBackground;
ParticleSystem psF, psE, psG;
Button creditBack;


//Global variables 
int rotation = 0;
Button[] menuButtons;
boolean drawBoxes;
int gameState = 0; 


void setup(){
  size(1000,800);
  smooth();
  
  //Initalize images
  titleImg = loadImage("Title.png");
  electricIcon = loadImage("Electricity_icon.png");
  fireIcon = loadImage("Fire_icon.png");
  stoneIcon = loadImage("Stone_Icon.png");
  labBackground = loadImage("Lab_Background.png");
  
  //Initalize particle systems
  psF = new ParticleSystem(new PVector(width/2,50), #ff3200);
  psE = new ParticleSystem(new PVector(width/2,50), #0099ff);
  psG = new ParticleSystem(new PVector(width/2,50), #996633);
  
  //Initalize meu buttons
  menuButtons = new Button[3];
  menuButtons[0] = new Button("New Game", PLAYING, new PVector(50, height/2 - 80), 40, color(255), color(255, 0, 0));
  menuButtons[1] = new Button("Credits", PLAYING, new PVector(50, height/2), 40, color(255), color(255, 0, 0));
  menuButtons[2] = new Button("Quit", QUIT, new PVector(50, height/2 + 80), 40, color(255), color(255, 0, 0));
  drawBoxes = false;
  
  creditBack = new Button("<- Back", MAIN_MENU, new PVector(125, height-75), 40, color(255), color(255, 0, 0));
}

void draw(){
  //Chose what to draw baised on gamestate
  switch (gameState){
    case (MAIN_MENU):
      displayMenu(); 
    break;
    
    case (PLAYING):
      displayMenu(); 
    break;
    
    case (CREDITS):
      displayCredits(); 
    break;
    
    case (QUIT):
      exit(); //Exits game
    break;
  }
}

void mousePressed() {
  for (int i=0;i<NUMMENUBUTTONS;i++){
    if (menuButtons[i].containsMouse()) {
      gameState = i+1; 
    }
  }
  
  if (creditBack.containsMouse() && gameState == CREDITS){
    gameState = creditBack.action;
  }
}

void displayMenu() {
  background(labBackground);
  
  //Display particle systems ----------------------
  psF.newOrigin((2*width/3)+(cos(radians(90 - rotation))*120), (2*height/3)-(sin(radians(90 - rotation))*120)); 
  psF.addParticle();
  psF.run();
  
  psG.newOrigin((2*width/3)+(cos(radians(90 - (rotation + 120)))*120), (2*height/3)-(sin(radians(90 - (rotation + 120)))*120)); 
  psG.addParticle();
  psG.run();
  
  psE.newOrigin((2*width/3)+(cos(radians(90 - (rotation + 240)))*120), (2*height/3)-(sin(radians(90 - (rotation + 240)))*120)); 
  psE.addParticle();
  psE.run();
  //-----------------------------------------------
  
  //Display Spinner ----------------------
  noStroke();
  pushMatrix();
    //translate(2*width/3,2*height/3);
    translate(4*width/6,4*height/6);
    rotate(radians(rotation));
    fill(#ff3200); //Red
    //ellipse(0,-120,100,100);
    ellipse(0,-170,150,150);
    image(fireIcon, -75, -245, 150,150);
    rotate(radians(120));
    fill(#006600); //Green (Brown)
    ellipse(0,-170,150,150);
    image(stoneIcon, -75, -245, 150,150);
    rotate(radians(120));
    fill(#0099ff); //Blue
    ellipse(0,-170,150,150);
    image(electricIcon, -75, -245, 150,150);
  popMatrix();
  rotation++;
  if (rotation == 360) rotation = 0;
  //--------------------------------------
   
  textAlign(LEFT);
  //Display Menu Buttons -----------------
  for (int i = 0; i < NUMMENUBUTTONS; i++) {
    menuButtons[i].draw(drawBoxes);
  }
  //--------------------------------------
  
  //Display Title ------------------------
  image(titleImg, width/2 - titleImg.width/2, height/6 - titleImg.height/2);
  //--------------------------------------
}

void displayCredits(){
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Developers",width/2,100);
  stroke(255);
  rect(width/2 - textWidth("Developers")/2,100, textWidth("Developers"), 1);
  text("Kieran Bingham",width/2, 200);
  text("Daniel Chen",width/2, 300);
  text("Ibrahim Bdira",width/2, 400);
   
  creditBack.draw(false); 
}