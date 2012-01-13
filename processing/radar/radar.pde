import promidi.*;
import fullscreen.*;

// Apparently, 
// +X is right
// +Y is down
// +Z is out of screen

// size of whole radar
float kRadius = 120;

// Rotate whole board 2 degrees per click
PVector kRotateAllDiff = new PVector(radians(2), radians(2), radians(2));
PVector g_rotateAll = new PVector(HALF_PI - 0.4, 0, -QUARTER_PI);
PVector g_translateAll = new PVector(400, 285, 100);
float g_scale = 2;
float kScaleAllDiff = 0.05;

void setup() 
{
  //randomSeed(1);
  size(802, 599, P3D);
  frameRate(30);  
  colorMode(RGB, 1.0);
  ellipseMode(RADIUS);
  shapeMode(CENTER);

}

void draw() 
{
  background(0);
  strokeWeight(4);
  //strokeJoin(ROUND);
  //strokeCap(PROJECT);
  lights();

  // Position system somewhere in the middle of screen
  translate(g_translateAll.x, g_translateAll.y, g_translateAll.z);

  // Rotate whole system  
  rotateX(g_rotateAll.x);
  rotateY(g_rotateAll.y);
  rotateZ(g_rotateAll.z);

  scale(g_scale);
  
    
  // Blue board
  fill(0, 0, 1.0, 0.4);
  ellipse(0, 0, kRadius, kRadius);
  
  
  renderMask();
}

void renderMask(){
  pushMatrix();
    resetBaseTransform(); 
    noStroke();
    fill(#0A0A09);
    beginShape();
      vertex(0,0);
      vertex(802, 0);
      vertex(802, 287);
      vertex(675, 287);
      curveVertex(740, 2310);
      curveVertex(675, 287);
      curveVertex(110, 287);
      curveVertex(370, 2310);
      vertex(0, 287);
      vertex(0,0);
    endShape(CLOSE);
    beginShape();
      vertex(0, 287);
      vertex(109, 287);
      vertex(329, 496);
      vertex(474, 496);
      vertex(675, 287);
      vertex(802, 287);
      vertex(802, 599);
      vertex(0, 599);
    endShape();
  popMatrix(); 
}



// Utils

void resetBaseTransform(){
      scale(g_scale/4);
    rotateZ(-g_rotateAll.z);
    rotateY(-g_rotateAll.y);
    rotateX(-g_rotateAll.x);
    translate(-g_translateAll.x, -g_translateAll.y, -g_translateAll.z);
}
