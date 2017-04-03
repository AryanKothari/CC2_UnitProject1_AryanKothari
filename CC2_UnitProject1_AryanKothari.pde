int cols, rows;

int scl = 50;

int w, h;

float[][] terrain; 

float flyingY = 0; 
float flyingX = 0;

//float lowheight = -300;
//float highheight = 300;

int terrainheight = int(random(0, 600));


PShape squareshape;
PShape skyshape;

PImage dirt;
PImage skypic;

import queasycam.*;
QueasyCam cam;

Sky sky;

void setup()
{
  fullScreen(P3D);
  w = 3000; 
  h = 3000;
  cols = w/ scl;
  rows = h/ scl;

  terrain = new float[cols][rows];

  dirt = loadImage("dirt.jpg");
  squareshape = createShape(BOX, scl);
  squareshape.setTexture(dirt);

  skypic = loadImage("sky.png");
  skyshape = createShape(SPHERE, 500);
  skyshape.setTexture(skypic);

  sky = new Sky();

  cam = new QueasyCam(this, 20f, 20000f);
  cam.speed = 10;              // default is 3
  cam.sensitivity = 0.5;

  camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
  translate(width/2, height/2, -100);

  float yoff = flyingY;


  for (int y = 0; y < rows; y++)
  {
    float xoff = flyingX; 
    for (int x = 0; x < cols; x++)
    {
      while (terrainheight % scl != 0) terrainheight = int(random(0, 600));
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, terrainheight, terrainheight);
      terrainheight = int(random(0, 600));
      println(terrainheight);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
}

void draw()
{ 
  background(150, 150, 255);

  noStroke();
  noFill();
  lights();
  //fill(153, 76, 0);

  //sky.Draw();

  translate(width/7, height/2);
  rotateX(PI/3);

  translate(-w/2, -h/2);

  for (int y = 0; y < rows -1; y++)
  {
    for (int x = 0; x < cols; x++)
    {

      pushMatrix();
      translate(x * scl, y * scl, terrain[x][y]);
      shape(squareshape);
      popMatrix();
    }
  }
}