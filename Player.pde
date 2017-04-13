class Player
{
  PVector pos;

  public PVector size;



  Player()
  {
    pos = cam.position;
  }

  public void collision()
  {
    for (int i = 0; i < block.size(); i++)
    {
      if (block.get(i).pos.x < pos.x + 0 &&
        block.get(i).pos.x + scl > pos.x &&
        block.get(i).pos.y < pos.y + 0 &&
        scl + block.get(i).pos.y > pos.y && block.get(i).pos.z < 
        pos.z + 0  && block.get(i).pos.z + scl > pos.z)
      {
        collision = true;
      } else
      {
        collision = false;
      }
    }
  }
}