class Vand {
  PVector position;
  PVector hastighed;
  PVector acceleration;
  float opacitet;

  Vand(PVector v) {
    acceleration = new PVector(0, 0.1); //vandets retning
    hastighed = new PVector(random(-1, 1), random(-4, -7)); //vandets hastighed
    position = v.copy(); //vandets position 
    opacitet = 255.0; //vandets synlighed
  }

  void run() {
    update();
    display();
  }

  // Metoden der opdatere positionen
  void update() {
    hastighed.add(acceleration); //gør at 'dør' tideligere
    position.add(hastighed); //sørger for at positionen ændre sig med hastigheden
    opacitet -= 10; //hvor hurtigt vandet mister synlighed
  }

  // metoden for den skal displayes
  void display() {
    stroke(6, 189, 231, opacitet);
    fill(6, 189, 231, opacitet);
    ellipse(position.x, position.y, 10, 10);
  }

  // sletter vandet
  boolean vandDoed() {
    if (opacitet < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
