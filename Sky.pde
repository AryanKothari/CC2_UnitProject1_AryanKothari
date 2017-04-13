class Sky 
{
  PVector pos;
  PShape skyshape;

  Sky()
  {
    pos = new PVector(width/8, height/1, -200);

    skyshape = createShape(SPHERE, 5000);
    skyshape.setTexture(skypic);
  }

  public void Draw()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(255);
    shape(skyshape);
    popMatrix();
  }
}