class Sun
{
  public PVector pos; 

  Sun()
  {
    pos = new PVector(4922.6655, -13.015428, 2797.4304 );
  }


  public void Draw()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(255,255,0);
    box(800);
    popMatrix();
  }
}