//Clase que representa las características de un planeta
class Planet implements SpaceObject{
  private final String name;
  private final int size;
  private final Rotation rotation;
  private final Coordinate coordinate;
  private float angle;
  private float speed;
  private PShape planet;
  private PImage texture;
  
  Planet(String name, int size, Coordinate coordinate, Rotation rotation, float speed, PImage texture){
    this.name = name;
    this.size = size;
    this.coordinate = coordinate;
    this.rotation = rotation;
    this.angle = 0;
    this.speed = speed;
    this.texture = texture;
  }
  
  public int getSize(){
    return size;
  }
  
  public Coordinate getCoordinate(){
    return coordinate;
  }
  
  public Rotation getRotation(){
    return rotation;
  }
  
  public float getAngle(){
    return angle;
  }
  
  public void display(){
    beginShape();
    planet = createShape(SPHERE, size);
    planet.setStroke(255);
    planet.setTexture(texture);
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
    text(name, -size/2 - name.length(), -size -5);
    shape(planet);
    popMatrix();
    
    angle+=speed;
    if (angle > 360)
      angle = 0;
  }
  
  
  
  public void display(Satellite s){
    beginShape();
    planet = createShape(SPHERE, size);
    planet.setStroke(255);
    planet.setTexture(texture);
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
    text(name, -size/2 - name.length(), -size - 5);
    shape(planet);
    
    s.display();
    s.move();
    popMatrix();
  }
  
  public void move(){
     angle+=speed;
    if (angle > 360)
      angle = 0;
  }
}
