ArrayList<Quad> quads;

void setup() {

  size(displayWidth, displayHeight);

  quads = new ArrayList<Quad>();

  //Groesse eines Wuerfels in der Wave, Hoehe der Wave, Y-Position der Wave, Geschwindigkeit mit der sich eine Welle bewegt, Laenge einer Welle, Startfarbe eines Fades(rechts), Endfarbe eines Fades

  createWave(13, 100, height/2, (double)-0.05, (double)0.07, new Vector3(255, 0, 0), new Vector3(0, 0, 101));
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
  int numOfQuads = width/quadSize +1;
  ArrayList<Vector3> colourList = colorFade(startClr, endClr, numOfQuads);

  int i = 0;

  while (pos.x < width - quadSize/2) {
    radians += frequency;

    quads.add(new Quad(new Vector2(pos.x, pos.y), radians, velocity, quadSize, waveHeight, wavePosY, colourList.get(i)));

    pos.x += quadSize;
    
    i++;
  }
}


ArrayList colorFade(Vector3 start, Vector3 end, int numOfQuads) {

  ArrayList<Vector3> fade = new ArrayList<Vector3>();

  Vector3 stepSize = new Vector3(0,0,0);
  Vector3 stepsNeeded = getDif(start,end);
  
  stepSize.x = stepsNeeded.x/numOfQuads;
  stepSize.y = stepsNeeded.y/numOfQuads;
  stepSize.z = stepsNeeded.z/numOfQuads;
  
  Vector3 cur = start;
  
  
  for (int i=0; i<numOfQuads; i++) {
     if (cur.x < end.x) {
       cur.x += stepSize.x;
     } else {
       cur.x-= stepSize.x;
     }
     if (cur.y < end.y) {
       cur.y += stepSize.y;
     } else {
       cur.y -= stepSize.y;
     }
     if (cur.z < end.z) {
       cur.z += stepSize.z;
     } else {
       cur.z -= stepSize.z;
     }
     
     Vector3 value = new Vector3(cur.x, cur.y, cur.z);
     fade.add(value);
  }

  return fade;
}


Vector3 getDif(Vector3 val1, Vector3 val2) {

  Vector3 dif = new Vector3(0, 0, 0);

  if (val1.x < val2.x) {
    dif.x = val2.x - val1.x;
  } else {
    dif.x = val1.x - val2.x;
  }

  if (val1.y < val2.y) {
    dif.y = val2.y - val1.y;
  } else {
    dif.y = val1.y - val2.y;
  }

  if (val1.z < val2.z) {
    dif.z = val2.z - val1.z;
    
  } else {
    dif.z = val1.z - val2.z;
  }
  
  return dif;
}
