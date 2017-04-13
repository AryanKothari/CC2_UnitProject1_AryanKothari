class Player
{
  private PVector pos;

  public PVector size;

  public boolean collision;

  Player()
  {
    pos = cam.position;
    collision = false;
  }

  //public void collision()
  //{
  //  for (int i = 0; i < block.pos.size(); i++)
  //  {
  //    if (blocks.pos.get(i).x < pos.x + 0 &&
  //      blocks.pos.get(i).x + blocks.scl > pos.x &&
  //      blocks.pos.get(i).y < pos.y + 0 &&
  //      blocks.scl + blocks.pos.get(i).y > pos.y && blocks.pos.get(i).z < 
  //      pos.z + 0  && blocks.pos.get(i).z + blocks.scl > pos.z)
  //    {
  //      collision = true;
  //    } else
  //    {
  //      collision = false;
  //    }
  //  }
  //}
}