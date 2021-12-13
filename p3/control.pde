void scene1() {
  background(200, 100,mouseX);  
  textAlign(CENTER); 
  fill(255);
  textSize(60);
  text("Hint",width/2,height/2-50);
  textSize(40);
  text("Click mouse to switch image",width/2,height/2+50);
  textSize(35);
  text("Press SPACE to scatter the points",width/2,height/2+150);
  textSize(30);
  text("Press 'SPACE' to hide the hint",width/2,height/2+250);
}

void mousePressed() {
    form ++;
    if (form > 3) {
      form= -1;
    }
    changeCol += random(20,50);
    if (changeCol >= 255) {
      changeCol -= random(20,70);
    }
    if (changeCol <= 0) {
      changeCol += random(10,50);
    }    
  } 
  
void keyPressed() {
  if (keyPressed && key == ' '){
    form = -1;
  }
}
  
