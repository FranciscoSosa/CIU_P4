//Clase que representa las características de un satélite
class Satellite implements SpaceObject{
  private final int size;
  private final Rotation rotation;
  private final Coordinate coordinate;
  private float angle;
  private float speed;
  private PShape satellite;
  private PImage texture;
  
  Satellite(int size, Coordinate coordinate, Rotation rotation, float speed, PImage texture){
    this.size = size;
    this.coordinate = coordinate;
    this.rotation = rotation;
    this.angle = 0;
    this.speed = speed;
    this.texture = texture;
  }
  
  public void display(){
    beginShape();
    satellite = createShape(BOX, size);
    satellite.setStroke(255);
    satellite.setTexture(texture);
    endShape(CLOSE);
    
    pushMatrix();
    switch(rotation){
      case X:
        rotateX(radians(angle));
        break;
      case Y:
        rotateY(radians(angle));
        break;
      case Z:
        rotateZ(radians(angle));
     break;
    }
    
    translate(coordinate.getPosX(), coordinate.getPosY(), coordinate.getPosZ());
    shape(satellite);
    popMatrix();
  }
 
  public void move(){
    angle+=speed;
    if (angle > 360)
      angle = 0;
  }
}
