int startX = 200;
int startY;
int endX = 200;
int endY;
int boltCount = 4;
int i = boltCount;

void setup()
{
  size(1000, 600);
  strokeWeight(8);
  background(255);
  frameRate(20);
}
void draw()
{
  //stroke((float)(Math.random()*50), (float)(Math.random()*150), (float)(255), 255.0);
  
  if (i < boltCount) {
      while(endX <= mouseX) {
        endX = startX + (int)(Math.random() * 30);
        endY = startY + (int)(Math.random() * 30 - 15);
      
        stroke((float)(Math.random()*50), (float)(Math.random()*150), (float)(255), (float)(Math.random()*155)+100);
        line(startX, startY, endX, endY);
      
        startX = endX;
        startY = endY;
     
      }  
      
      i++; 
      startX = 200;
      startY = mouseY;
      endX = 200;
      endY = mouseY;
     
  }
  
}

void mousePressed()
{
  fill(255);
  stroke(255);
  rect(195, 0, width-200, height);
  startY = mouseY;
  endY = mouseY;
  i = 0;
}

void drawPalpatine() {
  stroke(0);
  rect(0, 240, 120, 200);
  rect(120, 270, 80, 20);
  rect(120, 310, 80, 20);
}

