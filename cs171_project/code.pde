import controlP5.*;

ControlP5 cp5;

//modified code from lab 3
// I have changed the images ,speed and changed the direcrtion in which the objects move
//I have added multiple functions such as a menu screen ,10 levels with a highscore for each and instructions in the menu 

PFont labelFont; // for the font;
PImage scene, algae, jellyfish, player, plasticBag,plasticBottle,scene1;//images
//for menu background
int scene_X;
int scene_Y;

int algae_x, algae_y, algae_count;// intialisation for x,y coordinates and counting the algae
int jellyfish_x, jellyfish_y, jellyfish_count;//intialisation for x,y coordinates and counting the jellyfish
int plasticBag_x,plasticBag_y,plasticBag_count;//intialisation for x,y coordinates and counting the plastic bag
int plasticBottle_x,plasticBottle_y,plasticBottle_count;//intialisation for x,y coordinates and counting the plastic bottle
int player_x=400;
int player_y=300;
int player_speed=4;//turlte speed
int direction=0;
int speed=1;
float speedAmount=1;
int score=0, lives=3;//score and lifes
int quit_game=0;//quit game
boolean start=false;//intialisation for starting the game

// for creating 10 arrays to store each of the 10 level highscores
Knob speedKnob;
int[]  highscore=new int [10];
String lines[]=new String[10];

void setup()
{
  
  size(800, 599, P2D);
  frameRate(60);
  labelFont=createFont("Arial",20);
  lines = loadStrings("highscore.csv");//https://processing.org/reference/loadStrings_.html
 
  for(int i=0;i<10;i++)
  {
    highscore[i]=Integer.parseInt(lines[i]);//assigns the value at i in teh array lines to i in the highscore array
  }
    
  cp5 = new ControlP5(this);
  
    
  
  speedKnob=cp5.addKnob("speed").setRange(1,10).setPosition((width/2)-50,height/1.5).setRadius(50).setValue(1);//for creating the speed knob that allows 10 different levels of speed
  
//loading the images
  scene =loadImage("ocean.bmp");
  algae = loadImage("algae.png"); 
  jellyfish=loadImage("jellyfish.png");
  plasticBag=loadImage("plasticBag.png");
  plasticBottle=loadImage("plasticBottle.png");
  player = loadImage("turtle.png");
  

  textureMode(NORMAL); // Scale texture Top right (0,0) to (1,1)
  blendMode(BLEND); // States how to mix a new image with the one behind it
  noStroke(); // Do not draw a line around objects

  algae_x=width; // Choose algae starting position
  algae_y=(int)random(50, 585);
  jellyfish_x=width; // Choose jellyfish starting position
  jellyfish_y=(int)random(50, 585);
  plasticBag_x=width+200; //Choose plasitc bag starting position
  plasticBag_y=(int)random(50, 585);
  plasticBottle_x=width+200; //Choose plasitc bottle starting position
  plasticBottle_y=(int)random(50, 585);
}
//game
void game()
{
  //for increasing the speed of the game as it goes on, at a rate of 0.0005
  speedAmount=speedAmount+(speed*0.0005);
  
  setBg();//calling on the game background 
  pushMatrix(); 
  translate(algae_x, algae_y); 
  beginShape(); // Open graphics pipeline
  texture(algae); // Tell GPU to use algae to texture the polygon
  vertex( -20, -20, 0, 0); // Load vertex data (x,y) and (U,V) texture data into GPU
  vertex(20, -20, 1, 0); 
  vertex(20, 20, 1, 1); // Textured with an image of a algae
  vertex( -20, 20, 0, 1);
  endShape(CLOSE); // Tell GPU you have loaded shape into memory.
  popMatrix(); 
  
  pushMatrix(); 
  translate(jellyfish_x, jellyfish_y); 
  beginShape(); // Open graphics pipeline
  texture(jellyfish); // Tell GPU to use jellyfish to texture the polygon
  vertex( -20, -20, 0, 0); // Load vertex data (x,y) and (U,V) texture data into GPU
  vertex(20, -20, 1, 0); 
  vertex(20, 20, 1, 1); // Textured with an image of a drop
  vertex( -20, 20, 0, 1);
  endShape(CLOSE); // Tell GPU you have loaded shape into memory.
  popMatrix(); 

  pushMatrix();
  translate(plasticBag_x, plasticBag_y);
  beginShape(); // Draw plastic bag
  texture(plasticBag); // Tell GPU to use plastic bag to texture the polygon
  vertex( -20, -20, 0, 0);
  vertex(20, -20, 1, 0);
  vertex(20, 20, 1, 1);// Textured with an image of a drop
  vertex( -20, 20, 0, 1);
  endShape(CLOSE);// Tell GPU you have loaded shape into memory.
  popMatrix();
  
  pushMatrix(); 
  translate(plasticBottle_x, plasticBottle_y);
  beginShape(); // Draw plastic bottle
  texture(plasticBottle);// Tell GPU to use plastic bottle to texture the polygon
  vertex( -20, -20, 0, 0);
  vertex(20, -20, 1, 0);
  vertex(20, 20, 1, 1);// Textured with an image of a drop
  vertex( -20, 20, 0, 1);
  endShape(CLOSE);// Tell GPU you have loaded shape into memory.
  popMatrix();





  pushMatrix(); // Draw player

  translate(player_x, player_y);
  beginShape();//Draw player
  texture(player);// Tell GPU to use turtle(player) to texture the polygon
  vertex( -20, -20, 0, 0);
  vertex(20, -20, 1, 0);
  vertex(20, 20, 1, 1);// Textured with an image of a drop
  vertex( -20, 20, 0, 1);
  endShape(CLOSE);// Tell GPU you have loaded shape into memory.
  popMatrix();

  algae_x-=2+speedAmount; // Make "algae" move down the screen (two pixels at a time)
  if (algae_x<100) 
  {
    algae_x=width; // Restart the algae again 
    algae_y=(int)random(50, 585);
  }
  jellyfish_x-=4+speedAmount; // Make "jellyfish" move across the screen (4 pixels at a time)
  if (jellyfish_x<100) 
  {
    jellyfish_x=width; // Restart the jellyfish again 
    jellyfish_y=(int)random(50, 585);
  }

  plasticBag_x-=4+speedAmount; // Make "plastic bag" move across the screen (4 pixels at a time)
  if (plasticBag_x<100)
  {

    plasticBag_x=width;// Restart the plastic bag again
    plasticBag_y=(int)random (50, 585);
  }
  
  plasticBottle_x-=2+speedAmount; // Make "plastic bottle" move across the screen (2 pixels at a time)
  if (plasticBottle_x<100)
  {

    plasticBottle_x=width;// Restart the plastic bottle again
    plasticBottle_y=(int)random(50, 585);
  }
  //For controls
  if (keyPressed == true)
  {
    if (keyCode == DOWN && player_y<height)//Using the arrow key to move the player down and to create  border
    {
     
      player_y+=player_speed; // position move down
      
    }
    else if (keyCode == UP && player_y>50)//Using the arrow key to move the player up and to create  border
    {
     
      player_y-=player_speed; // position move up
    }
    
  }
  if ((algae_x>player_x-20)&&(algae_x<player_x+20)) // If algae is on same level as player
  {
    if ((algae_y>player_y-20)&&(algae_y<player_y+20))// And algae is near player
    {
      algae_count++;//increase count by 1
      score++;// Increase score by one 
      
      algae_x=width; // Restart a new algae
      algae_y=(int)random(50, 585);
    }
  }
  
  if ((jellyfish_x>player_x-20)&&(jellyfish_x<player_x+20)) // If jellyfish is on same level as player
  {
    if ((jellyfish_y>player_y-20)&&(jellyfish_y<player_y+20))// And jellyfish is near player
    {
      jellyfish_count++;//increase count by 1
      score+=2;//increase score by 2

      jellyfish_x=width; // Restart a new jellyfish
      jellyfish_y=(int)random(50, 585);
    }
  }
  

  if ((plasticBag_x>player_x-20)&&(plasticBag_x<player_x+20)) // If plastic bag is on same level as player
  {
    if ((plasticBag_y>player_y-20)&&(plasticBag_y<player_y+20)) // And plastic bag is near player
    {
      lives--; //lose a life


      plasticBag_x=width;// Restart a new plastic bag
      plasticBag_y=(int)random(50, 585);
    }
  }
  if ((plasticBottle_x>player_x-20)&&(plasticBottle_x<player_x+20)) // If plastic bottle is on same level as player
  {
    if ((plasticBottle_y>player_y-20)&&(plasticBottle_y<player_y+20)) // And plastic bottle is near player
    {
      lives--; //lose a life


      plasticBottle_x=width;// Restart a new plastic bottle
      plasticBottle_y=(int)random(50, 585);
    }
  }
  
  textSize(18); // Display score information on the screen
  fill(0, 0, 255);
  text("Algae:"+algae_count, 540, 20);
  
  textSize(18); // Display score information on the screen
  fill(0, 0, 255);
  text("Jellyfish:"+jellyfish_count, 625,20);

  

  fill(255, 0, 0);
  text("Lives:"+lives, 710,20);

  fill(0, 0, 0);
  text("Score:"+score, 620, 60);

  // Scoring and game logic
  textSize(40);
  if (lives<1) text("Game over", width/2, height/2); //  game over
  textSize(18);
  text("Press 'P' to pause and 'Q' to quit",200,20);//pause and quit game 
  text("speed: "+nf(speedAmount,0,2),425,20);//speed display


  

  if (algae_count>50) // Every 50 algae collected increase lives by one
  {
    algae_count-=50;
    lives++;
  }

  if (quit_game==1) // Wait five seconds before exiting
  {
    if(score>highscore[speed-1]){//if score is greater than highscore
     
      lines[speed-1]=""+score;//store it in the lines array
      
      saveStrings("highscore.csv",lines);//https://processing.org/reference/saveStrings_.html
    }
    delay(5000);//delay of 5 seconds before exiting
    exit();
  }

  if (lives<1) // All lives lost so game over but
  { // return to draw one more time to
    quit_game=1; // allow "Game Over to be displayed.
  }
  // Screen only drawn by graphics card at this point
  // not immediately after they are entered into GPU pipeline
}
// menu before the game begins
 void menu()
{
  scene1=loadImage("background_menu.jpg");//loading the background image for the menu
  background(scene1);
  textAlign(CENTER);
  textFont(labelFont);
  //display for the  all the text
  text("Press ENTER to start game",width/2,height/2);
  text("Highscore \n"+highscore[speed-1],width-100,100);
  textSize(30);
  //Legend for a brief guide on the game
  text("Legend\n",100,50);
  textSize(22);
  text("Scoring\n",100,100);
  textSize(18);
  text("Algae: 1 point\n Jellyfish: 2 points\n      Plastic bag/bottle: lose a life\n            Every 50 algae collected: +1 life",100,130);
  textSize(22);
  text("Controls\n",100,280);
  textSize(18);
  text("UP=Arrow up key\n DOWN=Arrow down key",100,310);
  textSize(22);
  text("Speed",100,380);
  textSize(18);
  text("10 levels to chose from ",100 ,410);
  
}

void draw()
{
  //For entering the game by pressing the enter key
  if(keyCode== ENTER)
  {
    
    start=true;//start the game if the enter key is pressed
    
    speedKnob.setVisible(false);//hide the speed knob if the game starts
    
    
  }
  
  if(start==true)
  {
    game();//if start is true,play the game
 
  }
  else
  {
    
     menu();// if start is false,display the menu
     speedKnob.setPosition((width/2)-50,height/1.5);//only displays if the menu is displayed
  }
  
 

}
//Creating a moving backgound for the game so that the game moves from right to left forever
void setBg()
{
  //makes the background loop again if it reaches the end
  image(scene,scene_X,scene_Y);
  image(scene,scene_X+scene.width,scene_Y);
  scene_X=scene_X-1;
  if(scene_X<-scene.width)
  {
    scene_X=0;
  }
}
//pause key
//https://forum.processing.org/one/topic/start-stop-pause-processing#25080000002073053.html
void keyPressed(){
  final int k=keyCode;
  final int s=keyCode;
  if(k=='P'){
    if(looping) noLoop();//stops the game from executing
    else        loop();//continues the game on as normal
    text("PAUSED",width/2,height/2);//text when on pause
  }
  if(s=='Q'){
    exit();//for exiting the game
  }
}
