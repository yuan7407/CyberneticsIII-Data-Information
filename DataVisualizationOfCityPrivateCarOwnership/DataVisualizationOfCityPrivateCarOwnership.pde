//Michael Yuan 17.03.16
//Update in 17.03.24
//Data Visualization of city private car ownership

ParticleSystem ps;
import controlP5.*;
ControlP5 cp5;
public float YearData = 100;
public float myCityCarData = 0.5;
PImage img;

void setup() {
  size(1024, 529);
  img = loadImage("Shanghai.jpg");

  cp5 = new ControlP5(this);
  cp5.addNumberbox("YEAR OF Shanghai", YearData, 0, 0, 200, 28).setId(2);
  cp5.getController("YEAR OF Shanghai").setMax(2015);
  cp5.getController("YEAR OF Shanghai").setMin(1996);

  ps = new ParticleSystem(new PVector(width/2, 50));
}

void draw() {
  background(img);
  textSize(32);
  text("Shanghai Size = 63400000 m^2", 0, 100);
  text("Normal Vehicle Size = 8 m^2", 0, 150);
  text("One Particle = 10000 Vehicles", 0, 200);
  text("One Particle = 10000 Vehicles", 0, 200);
  text("793 Particles can eat a Shanghai", 0, 250);



  ps.addParticle(random(width), random(height));
  PVector gravity = new PVector(0, 0.1);
  ps.applyForce(gravity);
  ps.update(myCityCarData*0.01);
  ps.intersection();
  ps.display();
  ps.checkEdges();
}



public void controlEvent(ControlEvent theEvent) {
  //println("got a control event from controller with id "+theEvent.getId());
  switch(theEvent.getId()) {
    case(2):  // numberboxB is registered with id 2
    YearData = (float)(theEvent.getController().getValue());
    if (YearData == 2015) {
      myCityCarData = 0.92;
    };
    if (YearData == 2014) {
      myCityCarData = 1.01;
    };
    if (YearData == 2013) {
      myCityCarData = 0.92;
    };
    if (YearData == 2012) {
      myCityCarData = 2.46;
    };
    if (YearData == 2011) {
      myCityCarData = 5.07;
    };
    if (YearData == 2010) {
      myCityCarData = 8.72;
    };
    if (YearData == 2009) {
      myCityCarData = 14.68;
    };
    if (YearData == 2008) {
      myCityCarData = 22.44;
    };
    if (YearData == 2007) {
      myCityCarData = 31.77;
    };
    if (YearData == 2006) {
      myCityCarData = 41;
    };
    if (YearData == 2005) {
      myCityCarData = 50.94;
    };
    if (YearData == 2004) {
      myCityCarData = 61.29;
    };
    if (YearData == 2003) {
      myCityCarData = 72.04;
    };
    if (YearData == 2002) {
      myCityCarData = 85.03;
    };
    if (YearData == 2001) {
      myCityCarData = 103.71;
    };
    if (YearData == 2000) {
      myCityCarData = 119.75;
    };
    if (YearData == 1999) {
      myCityCarData = 141.16;
    };
    if (YearData == 1998) {
      myCityCarData = 163.23;
    };
    if (YearData == 1997) {
      myCityCarData = 183.3;
    };
    if (YearData == 1996) {
      myCityCarData = 208.65;
    };
    //println(myCityCarData);
    break;
  }
}