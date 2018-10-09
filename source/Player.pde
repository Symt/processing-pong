class Player {
 int currentPos, x, y, h, w;
 public Player(int x, int h, int w) {
   this.x = x;
   y = height/2;
   this.h = h;
   this.w = w;
 }
 
 
 void draw() {
   /*
   
   currentPos = mouseY - mouseY%10;
   if (currentPos > y) {
      y+=10;
   } else if (currentPos != y) {
      y-=10;
   }
   */
   y = mouseY;
   fill(175);
   stroke(0);
   rectMode(CENTER);
   rect(x, y, w, h);
 }
}
