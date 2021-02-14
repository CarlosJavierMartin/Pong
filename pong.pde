import processing.sound.*;

int player1Score, player2Score;

//player1 Rect vars
int sizex, sizey, pos1, padding1;
//player2 Rect vars
int pos2, padding2;

//Move vars
int speed;

int xsing, ysing;
Player player1, player2;
Ball ball;
boolean bool;
int playerTurn;
SoundFile theme, sound, speedSound;
void setup(){
  size(1000,810);
  background(0);
  sizex = 15;
  sizey = 80;
  
  pos1 = height/2-40;
  padding1 = 30;
  
  pos2 = height/2-40;
  padding2 = width-30;
  
  speed = 7;
  
  bool = false;
  
  player1 = new Player(sizex, sizey, pos1, padding1, 0);
  player2 = new Player(sizex, sizey, pos2, padding2, 0);
  ball = new Ball(20, width/2, height/2);
  
  sound = new SoundFile(this, "Pokemon emerald wall bump.wav");
  speedSound = new SoundFile(this, "DBZ Instant Transmission Sound effect_160k.mp3");
  theme = new SoundFile(this, "Original Tetris theme (Tetris Soundtrack)_160k.mp3");
  theme.loop();
  theme.amp(0.1);
  gameReady();
}


void gameReady(){
  
  background(0);
  player1 = new Player(sizex, sizey, pos1, padding1, 5);
  player2 = new Player(sizex, sizey, pos2, padding2, 0);
  ball = new Ball(20, width/2, height/2);
  textFont(createFont("",32));
  text("\"Enter\" para comenzar",5,40);
  text("\"Retroceso\" reinicia marcador",5,85);
  text("W", 5, (height/2)-50);
  text("S", 5, (height/2)+75);
  
  text("Flechita arriba",775, (height/2)-50);
  text("Flechita abajo", 775, (height/2)+75);
  
  displayScore();
}

void draw(){
  
  if (keyPressed){
    if (key == ENTER && !bool){
      player1 = new Player(sizex, sizey, pos1, padding1, 0);
      player2 = new Player(sizex, sizey, pos2, padding2, 0);
      ball = new Ball(20, width/2, height/2);
      if( (int)random(0,10) <= 5) {xsing = -1;} else{xsing = 1;}
      if( (int)random(0,10) <= 5) {ysing = -1;} else{ysing = 1;}
      int spx = xsing * (int)random(2,4);
      int spy = ysing * (int)random(2,4);
      ball.setSpeed(spx, spy ,0);
      bool = true;
      if (spx < 0){playerTurn = 1;} else{ playerTurn = 2;}
    }
    if (key == BACKSPACE && !bool){
      player1Score = 0;
      player2Score = 0;
      gameReady();
      bool = false;
    }
  }
  
  if (bool){
    background(0);
    ballPlayerCollide();
    ball.move();
    ball.displayBall();
    player1.move();
    ballPlayerCollide();
    player1.displayPlayer(15);
    player2.move();
    ballPlayerCollide();
    player2.displayPlayer(0);
    isGameOver();
  } else {
    player1.displayPlayer(15);
    player2.displayPlayer(0);
    ball.displayBall();
  }
  displayMiddle();
  displayScore();
}

void ballPlayerCollide(){
  if (ball.getX() <= padding1+15 && ball.getX() > padding1 && ball.getY() > player1.getPos() && ball.getY() <= player1.getPos()+80 && playerTurn == 1){
    if (notCorner(1)){
      //System.out.println("Jugador 1a  " + ball.getY() + " " +player1.getPos() + " " + ball.getX() + " " + padding1);
      if (ball.setSpeed(-ball.getxSpeed(), ball.getySpeed(), 0.5)){
        speedSound.play();
      }
    } else {
      if (getCorner(1) == 1){
      //System.out.println("Jugador 1b+1 " + ball.getY() + " " +player1.getPos() + " " + ball.getX() + " " + padding1);
        if (ball.setSpeed(Math.abs(ball.getxSpeed()), -Math.abs(ball.getySpeed()), 0.5)){
          speedSound.play();
        }
      } else {
      //System.out.println("Jugador 1b-1  " + ball.getY() + " " +player1.getPos() + " " + ball.getX() + " " + padding1);
        if (ball.setSpeed(Math.abs(ball.getxSpeed()), Math.abs(ball.getySpeed()), 0.5)){
          speedSound.play();
        }
      }
    }
    sound.play();
    playerTurn = 2;
  }
  if (ball.getX() >= padding2 && ball.getX() < padding2+15 && ball.getY() > player2.getPos() && ball.getY() <= player2.getPos()+80 && playerTurn == 2){
    if (notCorner(2)){
      //System.out.println("Jugador 2a  " + ball.getY() + " " +player2.getPos());
      if (ball.setSpeed(-ball.getxSpeed(), ball.getySpeed(), 0.5)){
        speedSound.play();
      }
    } else {
      if (getCorner(2) == 1){
        //System.out.println("Jugador 2b+1  " + ball.getY() + " " +player2.getPos());
        if (ball.setSpeed(-Math.abs(ball.getxSpeed()), -Math.abs(ball.getySpeed()), 0.5)){
          speedSound.play();
        }
      } else {
        //System.out.println("Jugador 2b-1  " + ball.getY() + " " +player2.getPos());
        if (ball.setSpeed(-Math.abs(ball.getxSpeed()), Math.abs(ball.getySpeed()), 0.5)){
          speedSound.play();
        }
      }
    }
    sound.play();
    playerTurn = 1;
  }
}

boolean notCorner(int n){ //<>//
  switch(n){
    case 1:
        if (ball.getY() <= player1.getPos()+5+Math.abs(ball.getxSpeed()) || ball.getY() >= player1.getPos()+75-Math.abs(ball.getxSpeed())){
          //System.out.println("false1");
          return false;
        }
      break;
    case 2:
        if (ball.getY() <= player2.getPos()+5+Math.abs(ball.getxSpeed()) || ball.getY() >= player2.getPos()+75-Math.abs(ball.getxSpeed())){
          //System.out.println("false2");
          return false;
        }
      break;
  }
  
  return true;
}

int getCorner(int n){
  int diff1, diff2;
  switch(n){
    case 1:
      diff1 = ball.getY() - player1.getPos();
      //System.out.println(diff1);
      if (diff1 > 10){return -1;} else{return 1;}
    case 2:
      diff1 = ball.getY() - player2.getPos();
      //System.out.println(diff1);
      if (diff1 > 10){return -1;} else{return 1;}
  }
  return 0;
}

void isGameOver(){
  if (ball.getX() <= 0){
    player2Score ++;
    bool = false;
    gameReady();
  }
  
  
  if (ball.getX() >= width){
    player1Score ++;
    bool = false;
    gameReady();
  }
}

void displayMiddle(){
  for(int i = 60; i < height-60; i += 40){
    stroke(255);
    line(width/2, i, width/2, i+20);
  }
}

void displayScore(){
  textFont(createFont("bit5x3.ttf",50));
  text(player1Score, (width/2)-100,200);
  text(player2Score, (width/2)+80,200);
}

void keyPressed(){
  if (bool){
    if(keyCode == UP){
      player2.setSpeed(-speed);
    }
    if(keyCode == DOWN){
      player2.setSpeed(speed);
    }
    if(key == 'w' || key == 'W'){
      player1.setSpeed(-speed);
    }
    if(key == 's' || key == 'S'){
      player1.setSpeed(speed);
    }
  }
}
void keyReleased(){
  if (bool){
    if(keyCode == UP){
      player2.setSpeed(0);
    }
    if(keyCode == DOWN){
      player2.setSpeed(0);
    }
    if(key == 'w' || key == 'W'){
      player1.setSpeed(0);
    }
    if(key == 's' || key == 'S'){
      player1.setSpeed(0);
    }
  }
}


class Ball{
  int radio, x, y, xSpeed, ySpeed;
  float increment;

  Ball(int radio, int x, int y){
    this.radio = radio;
    this.x = x;
    this.y = y;
  }
  
  void displayBall(){
    circle(x, y, radio);
  }
  
  void move(){
    x+=xSpeed;
    y+=ySpeed;
    if(y > height){
      y = height;
      ySpeed = -ySpeed;
      y += ySpeed;
    }
    if(y < 0){
      y = 0;
      ySpeed = -ySpeed;
      y += ySpeed;
    }
  }
  
  boolean setSpeed(int xSpeed, int ySpeed, float increment){
    boolean res = false;
    if (this.xSpeed == 11 || this.ySpeed == 11){
      this.increment = 0.0;
    }
    this.increment += increment;
    this.xSpeed = xSpeed/Math.abs(xSpeed) * (Math.abs(xSpeed) + (int) this.increment);
    this.ySpeed = ySpeed/Math.abs(ySpeed) * (Math.abs(ySpeed) + (int) this.increment);
    if (this.increment >= 1.0){ this.increment = 0; res = true;}
    //System.out.println("Velocidad x: " + this.xSpeed + " || Velocidad y: " + this.ySpeed + "|| incremento: " + this.increment);
    return res;  
  }
  
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
  int getySpeed(){
    return ySpeed;
  }
  int getxSpeed(){
    return xSpeed;
  }
}


class Player{
  int x, y, pos, padding, speed;

  Player(int x, int y, int startingpos, int padding,int speed){
    this.x = x;
    this.y = y;
    this.pos = startingpos;
    this.padding = padding;
    this.speed = speed;
  }
  
  void displayPlayer(int n){
    //stroke(100);
    //line(padding+n,0, padding+n, height);
    rect(padding, pos, x, y);
  }
  
  void move(){
    pos += speed;
    if (pos > height-y){
      pos = height-y;
    }
    if (pos < 0){
      pos = 0;
    }
    
  }
  
  void setSpeed(int speed){
    this.speed = speed;
  }
  
  int getPos(){
    return pos;
  }
}
