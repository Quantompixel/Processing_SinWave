ArrayList<Quad> quads;

void setup() {

  size(displayWidth, displayHeight);

  quads = new ArrayList<Quad>();

  //Groesse eines Wuerfels in der Wave, Hoehe der Wave, Y-Position der Wave, Geschwindigkeit mit der sich eine Welle bewegt, Laenge einer Welle, Startfarbe eines Fades(rechts), Endfarbe eines Fades

  createWave(13, 100, height/2, (double)-0.05, (double)0.07, new Vector3(255, 0, 0), new Vector3(0, 0, 255));
}


void draw() {

  background(0);
  noStroke();

  for (Quad d : quads) {
    d.moveQuad();
  }
}



void createWave(int quadSize, int waveHeight, int wavePosY, double velocity, double frequency, Vector3 startClr, Vector3 endClr) {

  Vector2 pos = new Vector2(0-quadSize/2, height/2);
  double radians = 0;
  int steps = width/quadSize;
  ArrayList<Vector3> colourList = colorFade(startClr, endClr, steps);

  int i = 0;

  while (pos.x < width - quadSize/2) {
    radians += frequency;

    quads.add(new Quad(new Vector2(pos.x, pos.y), radians, velocity, quadSize, waveHeight, wavePosY, colourList.get(i)));

    pos.x += quadSize;

    i++;
  }
}


ArrayList colorFade(Vector3 start, Vector3 end, int steps) {

  ArrayList<Vector3> fade = new ArrayList<Vector3>();
  
  float stepsNeeded;
  if(start.getMin()<end.getMin()){
    stepsNeeded = start.getMin() + end.getMax();
  }
  else if(start.getMax()<end.getMax()){
    stepsNeeded = start.getMax() + end.getMax();
  }
  else{
    stepsNeeded = end.getMin() + start.getMax();
  }

  float f = stepsNeeded/steps;

  Vector3 c = start;

  for (int i=0; i<300; i++) {
    Vector3 wert;

    if (c.x < end.x) {
      c.x+=f;
    } else {
      c.x-=f;
    }
    if (c.y < end.y) {
      c.y+=f;
    } else {
      c.y-=f;
    }
    if (c.z < end.z) {
      c.z+=f;
    } else {
      c.z-=f;
    }

    //println(i+"  :  "+c.x + "," + c.y + "," + c.z);

    wert = new Vector3(c.x, c.y, c.z);

    fade.add(wert);
  }

  return fade;
}
