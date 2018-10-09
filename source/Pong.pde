Ball ball;
Player player;
Ai ai;
int[] c = {0, 0, 0};
boolean going = true;

void setup() {
  background(255, 255, 255);
  fullScreen();
  int x = width/2;
  int y = height/2;
  int radius = 10;
  player = new Player(width-30, 200, 25);
  ai = new Ai(30, 200, 25);
  ball = new Ball(x, y, radius, c, player, this, ai); 
  ai.setBall(ball);
}


void draw() {
  background(255);
  if (!going) {
    textSize(32);
    fill(50);
    textAlign(CENTER);
    text("You Lose", width/2, height/2);
    text("Score: " + ball.totalJumps, width/2, height/2+50); 
  } else {
    ball.draw();
    player.draw();
    ai.draw();
  }
}

void updateState() {
   going = (going) ? false : true; 
}
