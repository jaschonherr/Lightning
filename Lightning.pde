Bolt bolt;
Player player;
Score score;
float size = 100;
float playerX = 350;

float playerY = 700;
int health = 50;
int points = 0;
boolean[] keys = new boolean[128];

void setup() {
  size(800, 800);
  background(0);
  frameRate(100);
  bolt = new Bolt();
  player = new Player();
  score = new Score();
}

void draw() {
  if(health <= 0){
    score.gameOver();
  } else {
    player.move();
    player.display();
    bolt.checkTouching();
    bolt.display();
    score.display();
  }
}

void keyPressed() {
  keys[key] = true;
}

void keyReleased() {
  keys[key] = false;
}
class Bolt {

float startX;
int startY;
float endX;
int endY; 

  Bolt() {
    startX = width/2;
    startY = 0;
    endX = width/2;
    endY = 0;
  }

  void display() {
    endX = startX + (int)(Math.random() * 40 - 20);
    endY = startY + (int)(Math.random() * 25);
    
    strokeWeight(6);
    stroke(255);
    line(startX, startY, endX, endY);
    
    startX = endX;
    startY = endY;
    
    if(endY > height) {
      points += 100;
      noStroke();
      fill(0);
      rect(0, 0, width, height - size);
      rect(endX - 100, height - size, 200, 100);
      startX = random(150, width - size);
      startY = 0;
      endX = random(150, width - size);
      endY = 0;
    
    }
  }
  void checkTouching() {
    if(endY > height - size) {
      if(endX > playerX && endX < playerX + 100) {
        health--;
        noStroke();
        fill(255, 0, 0, 255);
        rect(playerX, playerY, size, size);
      }
    }
  } 
}
class Player {
  
  void display() {
    noStroke();
    fill(0);
    rect(playerX - 20, height - 100, 140, size);
    fill(0, 255, 0);
    rect(playerX, playerY, size, size);
  }
  
  void move() {
    if(playerX > 150) {
      if(keys['a']) {
        playerX -= 5;
      }
    } else {
      playerX += 5;
    }
    if(playerX < width - size) {
      if(keys['d']) {
        playerX += 5;
      }
    } else {
      playerX -= 5;
    }  
  }
}
class Score {
  
  void display() {
    fill(255);
    textSize(20);
    text("HP: " + health, 0, 20);
    text("Points: " + points, 0, 40);
  }
  
  void gameOver() {
    background(0);
    textSize(60);
    fill(255, 0, 0);
    text("GAME OVER", 5, 60);
    text("Your score: " + points, 5, 130);
  }
}
