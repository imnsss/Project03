// Project03
// Click the mouse to switch pictures

PImage[] shape;
Dot[] dot;

boolean Begin = false;
boolean Start = false;

int bgColor = 0;
int changeCol =100; // Color of the dots
int form = -1; // form: -1/0/1/2/3
int dotNum = 2001; // Number of dots


void setup() {
  size(900, 700, P2D);
  color(RGB, 255);
  imageMode(CENTER);
  noStroke();
  shape = new PImage[4];
  
  //loadImage
  for (int i=0; i<shape.length; i++) {
    shape[i] = loadImage(i+".png");
  }
  
  //loadPixel && Get the color on the image
  dot = new Dot[dotNum];
  
  for (int i=0; i<dotNum; i++) {
    dot[i] = new Dot();
    
    for (int n=0; n<4; n++) {
      dot[i].imgPos[n] = new PVector(random(width), random(height));
      color Color = shape[n].get(int(dot[i].imgPos[n].x), int(dot[i].imgPos[n].y));
      
      //Check whether the color brightness is less than 150
      boolean flag = true; 
      while (brightness(Color)<150 || flag) {
        dot[i].imgPos[n] = new PVector(random(width), random(height));
        Color = shape[n].get(int(dot[i].imgPos[n].x), int(dot[i].imgPos[n].y));
        flag = false;
        
        // Determine whether the dots overlap
        for (int j=0; j<i; j++) {    
          if (dot[i].collide(dot[j], n)) {
            flag = true;
            break;
          }
        }
      }
    }
  }
}

void draw() {
 
  background(bgColor);
  
  
      if(Begin == false){
        scene1();
      }
      if(keyPressed && key == ' '){
        Start = true;
      }
      if (Start == true) {
         background(0);
      }
      
  fill(0,0,0,25);
  rect(0,0,width,height);
  noStroke();
  
 for (int i=0; i<dotNum; i++) {   
    dot[i].display();
    if (form < 0) {
      dot[i].move();
    } else {
      dot[i].attract();
    }
  }
  println(form);
  surface.setTitle("PROJECT 3: Custom Pixel   " +  frameRate);
}


// REFERENCE
// https://openprocessing.org/sketch/377231
