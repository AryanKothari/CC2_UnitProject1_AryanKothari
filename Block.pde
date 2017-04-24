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
  
  private void Collisions()
  {
    if(cam.position.x <= pos.x + (scl/2) +10 && cam.position.x >= pos.x +(scl/2) -10
    && cam.position.z <= pos.z +(scl/2) && cam.position.z >= pos.z -(scl/2)
    && cam.position.y <= pos.y +(scl/2) && cam.position.y >= pos.y -(scl/2))
    {
      exit();
    }
    
    if(cam.position.x <= pos.x -(scl/2) +10 && cam.position.x >= pos.x -(scl/2) -10
    && cam.position.z <= pos.z +(scl/2) && cam.position.z >= pos.z -(scl/2)
    && cam.position.y <= pos.y +(scl/2) && cam.position.y >= pos.y -(scl/2))
    {
      exit();
    }

    if(cam.position.x <= pos.x +(scl/2) && cam.position.x >= pos.x -(scl/2) 
    && cam.position.z <= pos.z -(scl/2) +10 && cam.position.z >= pos.z -(scl/2) -10
    && cam.position.y <= pos.y +(scl/2) && cam.position.y >= pos.y -(scl/2))
    {
      exit();
    }
    
    if(cam.position.x <= pos.x +(scl/2) && cam.position.x >= pos.x -(scl/2)
    && cam.position.z <= pos.z +(scl/2) +10 && cam.position.z >= pos.z +(scl/2) -10
    && cam.position.y <= pos.y +(scl/2) && cam.position.y >= pos.y -(scl/2))
    {
      exit();
    }
    
    if(cam.position.x <= pos.x +(scl/2) && cam.position.x >= pos.x -(scl/2)
    && cam.position.z <= pos.z +(scl/2) && cam.position.z >= pos.z -(scl/2)
    && cam.position.y <= pos.y -(scl/2) && cam.position.y >= pos.y -(scl/2) -50)
    {
      exit();
    }
    else
    {
        cam.position.y += 20;
    }
  }
}