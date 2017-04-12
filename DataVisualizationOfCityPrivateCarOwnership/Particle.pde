class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  float r = random(3,6);


  Particle(float x, float y) {
    acceleration = new PVector();
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    lifespan = 200.0;
  }

  void run(float citylifespan) {
    update(citylifespan);
    display();
  }

  void intersects(ArrayList<Particle> particles) {
    for (Particle other : particles) {
      if (other != this) {
        PVector dir = PVector.sub(location, other.location);
        if (dir.mag() < r*2) {
          dir.setMag(0.5); 
          applyForce(dir);
        }
      }
    }
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  // Method to update location
  void update(float citylifespan) {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= citylifespan;
  }

  // Method to display
  void display() {
    noStroke();
    fill(#08799b, lifespan);
    rect(location.x, location.y, r*2, r*2);
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width;
      velocity.x *= -0.1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -0.1;
    }

    if (location.y > height) {
      velocity.y *= 0.1;
      location.y = height;
    }
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}