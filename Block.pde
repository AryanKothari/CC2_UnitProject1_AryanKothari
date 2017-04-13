class Block
{

  public PVector pos;
  PShape block;

  Block(PVector _pos)
  {

    block = createShape(BOX, scl);
    block.setTexture(dirt);
    
    pos = _pos;
  }


  public void Draw()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    shape(block);
    popMatrix();
  }
}