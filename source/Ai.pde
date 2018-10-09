class Ai {
 int currentPos, x, y, h, w;
 Ball b;
 public Ai(int x, int h, int w) {
   this.x = x;
   y = height/2;
   this.h = h;
   this.w = w;
 }
 
 
 void draw() {
   currentPos = (int) (b.y - b.y%10);
   if (currentPos > y) {
      y += 10; 
   } else if (currentPos != y) {
     y -= 10;
   }
   fill(175);
   stroke(0);
   rectMode(CENTER);
   rect(x, y, w, h);
 }
 
 
 void setBall(Ball b) {
   this.b = b;
 }
}
