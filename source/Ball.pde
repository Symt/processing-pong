class Ball {
  int[] c;
  int x, r;
  float y;
  float yv = 0;
  float gravity = 0.1;
  float xv = 10;
  Player p;
  Pong main;
  Ai a;
  int jumps = 0;
  int totalJumps = 0;
  public Ball(int x, int y, int radius, int[] c, Player p, Pong main, Ai a) {
    r = radius;
    this.c = c;
    this.x = x;
    this.y = y;
    this.p = p;
    this.main = main;
    this.a = a;
  }

  void draw() {
    fill(c[0], c[1], c[2]);
    ellipse(x, y, r, r);    
    y += yv;
    x += xv;
    yv = yv + gravity;
    if (y > height) {
      yv *= -1;
      y = height;
      jumps++;
      totalJumps++;
    }

    if (y < 0) {
      y = 0;
      yv *= -1;
    }

    if (x < 0) {
      main.updateState("win");
    } else if (x > width) {
      main.updateState("lose");
    }
    if (circleRect(x, y, r, p.x, p.y-p.h/2, p.w, p.h) || circleRect(x, y, r, a.x, a.y-a.h/2, a.w, a.h)) {
      xv *= -1;
    }

    if (jumps >= 5) {
      jumps = 0;
      xv+=2;
      y *= 1.1;
    }
  }

  boolean circleRect(float cx, float cy, float rad, float rx, float ry, float rw, float rh) {
    float testX = cx;
    float testY = cy;

    if (cx < rx)         testX = rx;
    else if (cx > rx+rw) testX = rx+rw;
    if (cy < ry)         testY = ry;
    else if (cy > ry+rh) testY = ry+rh;

    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );
    if (distance <= rad) {
      return true;
    }
    return false;
  }
}
