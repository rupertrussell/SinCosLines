// SinCosLines by Henrique Bergamo  
// https://www.openprocessing.org/sketch/544500
// fork by Rupert Russell 23 July 2020
// artwork on redbubble at: 

// factor = -1.0E-5_v1=0.41559017_numLines=922
// factor = 1.0E-6_v1=0.35820705_numLines=925

float t;
float angle = 0;
int numLines = 922;
float v1 = 0.35820705;
float v2;
boolean animate = false;
float factor = 0.000001;

void setup() {
  background(20);
  size(500, 500);
  // v1 = random(0.4)+0.2;
  smooth(2);
}

void draw() {
  background(0);

  stroke(255, 200);

  translate(width/2-40, height/2);
  rotate(sin(angle));

  for (int i=1; i < numLines; i++) {
    strokeWeight(4);
    point(x(t+i), y(t+i));
    point(x2(t+i), y2(t+i));

    strokeWeight(1.2);
    line(x(t+i), y(t+i), x2(t+i), y2(t+i));
  }

  if (animate) { 
    v1 = v1 + factor;
    t += 0.005;
    angle+= 0.01;
  }
}

void mousePressed() {
  PrintValues();
}

void keyPressed() {
  if (key == 's'  || key == 'S') {
    save("factor = " + factor +  "_v1=" + v1 + "_numLines=" + numLines +  ".png");
  }


  if (key == 'A') {
    animate = false;
  }
  
  
  if (key == 'a') {
    animate = true;
  }

  if (key == ' ') {
    v1 = random(0.4)+0.2;
    PrintValues();
  }

  if (keyCode == LEFT) {
    v1 = v1 + factor;
    PrintValues();
  } else if (keyCode == RIGHT) {
    v1 = v1 - factor;
    PrintValues();
  } 

  if (keyCode == UP) {
    numLines+=1;
    PrintValues();
  } else if (keyCode == DOWN) {
    numLines-=1;
    PrintValues();
  }
}

float x(float t) {
  return sin(t/10)*100 + cos(t/v1)*100;
}

float y(float t) {
  return cos(t/10)*100 + sin(t/v1)*100;
}


float x2(float t) {
  return sin(t/10)*10 + cos(t/v1)*100;
}

float y2(float t) {
  return cos(t/10)*10 + sin(t/v1)*100;
}

void PrintValues() {

  println("v1 = " + v1);
  println("v2 = " + v2);
  println("numLines = " + numLines);
}
