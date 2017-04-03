class Sky 
{
  PVector pos;

  Sky()
  {
    pos = new PVector(width/2, height/2, -500);
  }

  public void Draw()
  {
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    shape(skyshape);
    popMatrix();
  }
}