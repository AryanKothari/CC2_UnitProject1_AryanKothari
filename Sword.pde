class Sword
{
  private PVector pos;
  private PShape sword;

  Sword()
  {
    pos = new PVector(cam.position.x + 50, cam.position.y + 60, cam.position.z + 50);
    sword = createShape(BOX, 500);
    sword.setTexture(swordpic);
  }

  public void Draw()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    fill(255);
    shape(sword);
    popMatrix();
  }
}