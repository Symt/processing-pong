Ball ball;
Player player;
Ai ai;
int[] c = {0, 0, 0};
String cond = "";
boolean going = true;
boolean paused = false;
boolean started = false;
int px, py;

void setup() {
  background(255, 255, 255);
  fullScreen();
  int x = width/2;
  int y = height/2;
  int radius = 10;
  px = width/2;
  py = height/2+100;
  player = new Player(width-30, 200, 25);
  ai = new Ai(30, 200, 25);
  ball = new Ball(x, y, radius, c, player, this, ai); 
  ai.setBall(ball);
}


void draw() {
  background(255);
  if (!started) {
    textSize(32);
    fill(50);
    textAlign(CENTER);
    text("Gravity Pong", width/2, height/2);
    textSize(28);
    text("Use your mouse to play", width/2, height/2+50); 
    rectMode(CENTER);
    noFill();
    stroke(0);
    rect(width/2, height/2, 400, 400);
    fill(36);
    stroke(219);
    rect(px, py, 200, 50, 10);
    fill(255);
    textSize(16);
    text("Begin", width/2, height/2+108);
  } else if (!going) {
    textSize(32);
    fill(50);
    textAlign(CENTER);
    text("You " + cond + "!", width/2, height/2);
    text("Score: " + ball.totalJumps, width/2, height/2+50); 
    textSize(16);
    text("Click anywhere to play again or ESCAPE to quit", width/2, height/2+116);
  } else {
    if (!paused) {
      ball.draw();
      player.draw();
      ai.draw();
    } else {
      textSize(32);
      fill(50);
      textAlign(CENTER);
      text("Game Paused", width/2, height/2);
      text("Current Score: " + ball.totalJumps, width/2, height/2+50); 
      rectMode(CENTER);
      fill(36);
      stroke(219);
      rect(px, py, 200, 50, 10);
      fill(255);
      textSize(16);
      text("Resume", width/2, height/2+108);
    }
  }
}

void updateState(String condition) {
  going = (going) ? false : true; 
  cond = condition;
}

void mousePressed() {
  if (!going) {
    reset();
  } else {
    if (overRect(px, py, 200, 50)) {
      if (paused) {
        paused = false;
      } else if (!started) {
        started = true;
      }
    }
  }
}

void reset() {
  going = true;
  ball.x = width/2;
  ball.y = height/2;
  player.y = height/2;
  ai.y = height/2;
  ball.totalJumps = 0;
  ball.jumps = 0;
  ball.yv = 0;
  ball.xv = 10;
  paused = false;
  ball.xv *= random(0.8, 1.2);
}

boolean overRect(int x, int y, int w, int h) {
  if (mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2) {
    return true;
  } else {
    return false;
  }
}

void keyPressed() {
  if (key == ESC) {
    if (!paused && going && started) {
      key = 0;
      paused = true;
    }
  }
}
