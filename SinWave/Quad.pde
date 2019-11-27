class Quad {
  PVector pos = new PVector(0, 0);
  double radians;
  double velocity;
  int size;
  int waveHeight;
  int wavePosY;
  PVector colour;

  public Quad(PVector pos, double rad, double vel, int size, int waveHeight, int wavePosY, PVector colour) {
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

    this.pos.y = (float)(wavePosY + Math.sin(this.radians) * waveHeight);

    fill(colour.x, colour.y, colour.z);
    rect((float)this.pos.x, (float)this.pos.y, this.size, this.size);
  }
}
