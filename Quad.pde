class Quad {
  Vector2 pos = new Vector2(0, 0);
  double radians;
  double velocity;
  int size;
  int waveHeight;
  int wavePosY;
  Vector3 colour;

  public Quad(Vector2 pos, double rad, double vel, int size, int waveHeight, int wavePosY, Vector3 colour) {
    this.pos = pos;
    this.radians = rad;
    this.velocity = vel;
    this.size = size;
    this.waveHeight = waveHeight;
    this.wavePosY = wavePosY;
    this.colour = colour;
  }

  public void moveQuad() {
    this.radians += velocity;

    this.pos.y = wavePosY + Math.sin(this.radians) * waveHeight;

    fill(colour.x, colour.y, colour.z);
    rect((float)this.pos.x, (float)this.pos.y, this.size, this.size);
  }
}
