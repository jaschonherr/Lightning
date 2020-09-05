Ball[] balls = new Ball[100];

void setup(){
  size(800, 800, P2D);
  frameRate(144);
  
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball();
  }
}

void draw(){
  background(255);
  
  for(int i = 0; i < balls.length; i++){
    balls[i].display();
    balls[i].move();
  }
}

class Ball{

float x;
float y;
float size;
float xSpeed;
float ySpeed;
float xFlip = random(0, 1);
float yFlip = random(0, 1);
float r = random(100);
float g = random(100);
float b = random(100);
  
  Ball(){
    size = random(5, 15);
    x = random(size/2, width - size/2);
    y = random(size/2, height - size/2);
    xSpeed = random(.2, .6);
    if(xFlip > 0.5){
      xSpeed = -xSpeed;
    }
    
    ySpeed = random(.2, .6);
    if(yFlip > 0.5){
      ySpeed = -ySpeed;
    }
  }
  
  void display(){
    noStroke();
    fill(r, 255, b, 160);
    ellipse(x, y, size, size);
  }

  void move(){
    x = x + xSpeed;
    if(x > width - size/2 || x < size/2){
      xSpeed = -xSpeed;
    }
    
    y = y + ySpeed;
    if(y > height - size/2 || y < size/2){
      ySpeed = -ySpeed;
    }
  }
}
