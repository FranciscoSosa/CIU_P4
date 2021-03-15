//Clase que representa las características de un sol
class Sun implements SpaceObject{
  private final String name;
  private final int size;
  private final Rotation rotation;
  private final Coordinate coordinate;
  private float angle;
  private float speed;
  private PShape sun;
  private PImage texture;
  
  Sun(String name, int size, Coordinate coordinate, Rotation rotation, float speed, PImage texture){
    this.name = name;
    this.size = size;
    this.coordinate = coordinate;
    this.rotation = rotation;
    this.angle = 0;
    this.speed = speed;
    this.texture = texture;
  }
  
  
  public void display(){
    translate(coordinate.getPosX(), coordinate.getPosY(), coordinate.getPosZ());
    
    beginShape();
    sun = createShape(SPHERE, size);
    sun.setStroke(255);
    sun.setTexture(texture);
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
    text(name, -size/2 - name.length(), -size - 5);
   shape(sun);
    popMatrix();
  }
  
  public void move(){
     angle+=speed;
    if (angle > 360)
      angle = 0;
  }
}
