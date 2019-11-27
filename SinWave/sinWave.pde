ArrayList<Quad> quads;

void setup() {

  size(displayWidth, displayHeight);

  quads = new ArrayList<Quad>();

  //Groesse eines Wuerfels in der Wave, Hoehe der Wave, Y-Position der Wave, Geschwindigkeit mit der sich eine Welle bewegt, Laenge einer Welle, Startfarbe eines Fades(rechts), Endfarbe eines Fades

  createWave(13, 100, height/2, (double)-0.05, (double)0.07, new PVector(255, 0, 0), new PVector(0, 0, 101));
}


void draw() {

  background(0);
  noStroke();

  for (Quad d : quads) {
    d.moveQuad();
  }
}



void createWave(int quadSize, int waveHeight, int wavePosY, double velocity, double frequency, PVector startClr, PVector endClr) {

  PVector pos = new PVector(0-quadSize/2, height/2);
  double radians = 0;
  int numOfQuads = width/quadSize +1;
  ArrayList<PVector> colourList = colorFade(startClr, endClr, numOfQuads);

  int i = 0;

  while (pos.x < width - quadSize/2) {
    radians += frequency;

    quads.add(new Quad(new PVector(pos.x, pos.y), radians, velocity, quadSize, waveHeight, wavePosY, colourList.get(i)));

    pos.x += quadSize;
    
    i++;
  }
}


ArrayList colorFade(PVector start, PVector end, int numOfQuads) {

  ArrayList<PVector> fade = new ArrayList<PVector>();

  PVector stepSize = new PVector(0,0,0);
  PVector stepsNeeded = getDif(start,end);
  
  stepSize.x = stepsNeeded.x/numOfQuads;
  stepSize.y = stepsNeeded.y/numOfQuads;
  stepSize.z = stepsNeeded.z/numOfQuads;
  
  PVector cur = start;
  
  
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
     
     PVector value = new PVector(cur.x, cur.y, cur.z);
     fade.add(value);
  }

  return fade;
}


PVector getDif(PVector val1, PVector val2) {

  PVector dif = new PVector(0, 0, 0);

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
