//clase para representar coordenadas en el espacio
class Coordinate{
  private final float posX;
  private final float posY;
  private final float posZ;
  
  public Coordinate(float posX, float posY, float posZ){
    this.posX = posX;
    this.posY = posY;
    this.posZ = posZ;
  }
  
  public float getPosX(){
    return posX;
  }
  
  public float getPosY(){
    return posY;
  }
  
  public float getPosZ(){
    return posZ;
  }
}
