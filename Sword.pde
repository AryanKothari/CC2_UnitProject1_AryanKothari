class Sword
{
  private PVector pos;
  private PShape sword;

  Sword()
  {
    pos = new PVector(cam.position.x + 50, cam.position.y + 50,cam.position.z + 50);
    sword = createShape(BOX, 100);
    sword.setTexture(swordpic);
  }

  public void Draw()
  {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    pos.set(cam.position.x, cam.position.y,cam.position.z + 5 );
    fill(255);
    shape(sword);
    popMatrix();
  }
}