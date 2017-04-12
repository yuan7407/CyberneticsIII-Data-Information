class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem(PVector location) {
    particles = new ArrayList<Particle>();
  }

  void addParticle(float x, float y) {
    particles.add(new Particle(x, y));
  }

  void checkEdges() {
    for (Particle p : particles) {
      p.checkEdges();
    }
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void intersection() {
    for (Particle p : particles) {
      p.intersects(particles);
    }
  }


  void update(float citylifespan) {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      println(i);
      p.update(citylifespan);
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}