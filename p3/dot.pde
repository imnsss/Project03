class Dot {
  
  PVector pos, vel;
  PVector[] imgPos;
  float size;

  Dot() {
    size = random(3.5, 3.5);
    pos = new PVector(random(size/2, width-size/2), random(size/2, height-size/2));
    imgPos = new PVector[4];
    imgPos[0] = new PVector(random(width), random(height));
    imgPos[1] = new PVector(random(width), random(height));
    imgPos[2] = new PVector(random(width), random(height));
    imgPos[3] = new PVector(random(width), random(height));
    vel = PVector.random2D().mult(2);
  }

  void move() {
    pos.add(vel);
    
// Set a Border: Prevent the dots from getting off the screen
    if (pos.x-size/2<0) {  // x < 0                                  
      pos.x= size/2;
      vel.x *= -1;
    }
    if (pos.x+size/2>width) {  // x > width(900)
      pos.x = width-size/2;
      vel.x *= -1;
    }
    if (pos.y-size/2<0) {  // y < 0
      pos.y = size/2;
      vel.y *= -1;
    }
    if (pos.y+size/2>height) {  // y > height(700)
      pos.y = height-size/2;
      vel.y *= -1;
    }
  }
  
  void display() {
    fill(255, changeCol, changeCol); 
    ellipse( pos.x, pos.y, size*1.25, size*1.25);
  }

  void attract() {
    pos.x += (imgPos[form].x-pos.x)/20; 
    pos.y += (imgPos[form].y-pos.y)/20;
  }
  
// Determine whether the dots overlap
  boolean collide(Dot b, int s ) { 
    PVector p = b.imgPos[s];
    float d = PVector.dist(imgPos[s], p);
    float overlap = (size/2 + b.size/2) - d;
    if (overlap>0) {
      return true;
    } else { 
      return false;
    }
  }
}
