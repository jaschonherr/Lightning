float x = 0;
float y = 0;
float xSpacing;
float ySpacing;
void setup() {
  size(1000, 1000);
  frameRate(144);
}

void draw() {
  background(0);
  
  xSpacing = 1;
  ySpacing = 1;
  
  xSpacing = xSpacing + mouseX;
  ySpacing = ySpacing + mouseY;
  
  //System.out.println("X: " + xSpacing);
  //System.out.println("Y: " + ySpacing);
  
  stroke(255);
  strokeWeight(1);
  
  x = 0;
  while(x < width) {
    line(x, 0, x, height);
    x = x + xSpacing;
  }
  
  y = 0;
  while(y < height) {
    line(0, y, width, y);
    y = y + ySpacing;
  }
}
