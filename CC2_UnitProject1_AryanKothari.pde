float flyingY = 0; 
float flyingX = 0;

PImage dirt;
PImage skypic;
PImage swordpic;

ArrayList<Block> block = new ArrayList<Block>();

int cols, rows;

int scl = 50;

int w = 1500;
int h = 1500;

float[][] terrain; 
int terrainheight = int(random(0, 600));

Sky sky;
Sword sword;
Player player;
Sun sun;

boolean collision = false;

PVector pAcceleration, pVelocity, pPosition;


import queasycam.*;

QueasyCam cam;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer minecraft;

void setup()
{
  fullScreen(P3D);
  background(150, 150, 255);

  stroke(255);
  lights();

  cam = new QueasyCam(this);
  cam.speed = 5;              // default is 3
  cam.sensitivity = 0.5;    
  cam.position = new PVector(1544.5858, 190.53618, 1350.522);
  perspective(PI/3, (float)width/height, 0.01, 10000);

  minim = new Minim(this); //Music 
  minecraft = minim.loadFile("minecraft.mp3");
  minecraft.play();
  minecraft.loop();


  dirt = loadImage("dirt.jpg");
  skypic = loadImage("sky.png");
  swordpic = loadImage("sword.png");

  sky = new Sky();
  sword = new Sword();
  player = new Player();
  sun = new Sun();

  translate(width/2, height/2, -100);

  cols = w/ scl;
  rows = h/ scl;
  terrain = new float[cols][rows];

  for (int y = 0; y < rows; y++)
  {
    float yoff = flyingY;
    float xoff = flyingX; 
    for (int x = 0; x < cols; x++)
    {
      while (terrainheight % scl != 0) terrainheight = int(random(0, 600));
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, terrainheight, terrainheight);
      terrainheight = int(random(0, 600));
      xoff += 0.1;
    }
    yoff += 0.1;
  }

  for (int y = 0; y < rows -1; y++)
  {
    for (int x = 0; x < cols; x++)
    {
      for (int z = 0; z < terrain[x][y]/scl; z++)
      {
        block.add(new Block(new PVector(x * scl, y * scl, terrain[x][y] - (z * scl))));
      }
    }
  }
}

void draw()
{
  background(150, 150, 255);

  translate(width/7, height/2);
  rotateX(PI/3);

  translate(w/2, h/2);

  for (int i = 0; i < block.size(); i++)
  {
    block.get(i).Draw();
  }

  sun.Draw();
  
  CanvasIsHit();
 
}



void CanvasIsHit()
{
  for (int i = 0; i < block.size(); i++)
  {
    if (block.get(i).pos.x < cam.position.x + 0 &&
      block.get(i).pos.x + scl > cam.position.x &&
      block.get(i).pos.y < cam.position.y + 0 &&
      scl + block.get(i).pos.y > cam.position.y && block.get(i).pos.z < 
      cam.position.z + 0 && block.get(i).pos.z + scl > cam.position.z)
    {
      exit();
    }
  }
}