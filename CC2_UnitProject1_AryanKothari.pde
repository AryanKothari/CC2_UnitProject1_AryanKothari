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

  minim = new Minim(this); //Music 
  minecraft = minim.loadFile("minecraft.mp3");
  minecraft.play();
  minecraft.loop();


  dirt = loadImage("dirt.jpg");
  skypic = loadImage("sky.png");
  swordpic = loadImage("sword.png");

  cam = new QueasyCam(this, 0.01f, 1000f);
  cam.position = new PVector(246.00465, -88.16515, 85.86095);
  cam.setSensitivity(1f);
  cam.speed = 2;

  sky = new Sky();
  sword = new Sword();
  player = new Player();

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
      println(terrainheight);
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

  for(int i = 0; i < block.size(); i++)
  {
    block.get(i).Draw();
  }
  sword.Draw();

  //player.collision();

  //if (collision)
  //{
  //  exit();
  //}
}