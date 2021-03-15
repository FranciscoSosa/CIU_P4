//import gifAnimation.*;
int px;
int pz;
int incz;
PImage space;
boolean perspective;
boolean helpScreen;

Sun sun;
Planet p1;
Planet p2;
Planet p3;
Planet p4;
Planet p5;
Satellite s;
Satellite s2;

//GifMaker gifFile;
//int count;

void setup(){
  size(600, 600, P3D);
  stroke(0);
  
  imageMode(CORNER);
  space = loadImage("img/space.jpg");
  
  //gifFile = new GifMaker(this, "animacion.gif");
  //count = 0;
  
  sun = new Sun("SS-100", 50, new Coordinate(width/2, height/2, 0),  Rotation.Y, 0.25, loadImage("img/sunmap.jpg"));
  p1 = new Planet("PX-22", 20, new Coordinate(-width*0.15, 0, 0),  Rotation.Y, 0.25, loadImage("img/earthcloudmap.jpg"));
  p2 = new Planet("PX-11", 20, new Coordinate(-width*0.25, 0, 0),  Rotation.Y, 0.25, loadImage("img/jupiter.jpg"));
  p3 = new Planet("PX-33", 10, new Coordinate(-width*0.35, 0, 0),  Rotation.Y, 0.5, loadImage("img/neptunemap.jpg"));
  p4 = new Planet("PX-44", 20, new Coordinate(width*0.2, 0, 0),  Rotation.Z, 0.25, loadImage("img/venusmap.jpg"));
  p5 = new Planet("PX-55", 20, new Coordinate(0, -height*0.25, 0), Rotation.X, 0.25, loadImage("img/plutobump.jpg"));
  s = new Satellite(5, new Coordinate(0, -height*0.05, 0), Rotation.Z, 0.5, loadImage("img/venusbump.jpg"));
  
  px = 0;
  pz = 0;
  incz = 0;
  
  perspective = true;
  helpScreen = true;
}

void draw(){
  
  if(helpScreen){
    background(0);
    pushMatrix();
    translate(width/2, height/2);
    textAlign(CENTER);
    textSize(14);
    text("Uso", 0, -160);
    text("Presiona <w> para que la nave inicie su movimiento", 0, -140);
    text("Presiona <a> y <d> para mover la nave en el eje x",0 , -120);
    text("Presiona <s> para parar la nave", 0, -100);
    text("Presiona <c> para ver desde la nave y <p> para volver a la vista general", 0, -80);
    text("Presiona <r> para situar la nave en sus posición inicial", 0, -60);
    text("Clic para visualizar el sistema", 0, -20);
    popMatrix();
  }else{
    background(space);
    
    pushMatrix();
    translate(width/2 - px, height/2, 300 - pz);
    stroke(255, 0, 0);
    box(20);
    popMatrix();
    
    if(!perspective){
      camera(width/2 - px, height/2, 300 - pz, width/2.0, height/2.0, 0, 0, 1, 0);
    }else{
      camera();
    }
    
    
    sun.display();
    p1.display();
    p2.display();
    p3.display();
    p4.display();
    p5.display(s);
    
    p1.move();
    p2.move();
    p3.move();
    p4.move();
    p5.move();
    sun.move();
    
    pz += incz;
  }
  
  /*
  if (count % 10 == 0)
    gifFile.addFrame();
  
  count++;
  */
}

void keyPressed() {
  switch(key){
    case 's':
      incz = 0;
      break;
    case 'w':
      incz = 1;
      break;
    case 'a':
      px += 10;
      break;
    case 'd':
      px -= 10;
      break;
    case 'p':
      perspective = true;
      break;
    case 'c':
      perspective = false;
      break;
    case 'r':
      px = 0;
      pz = 0;
      incz = 0;
      break;
    /*  
    case 'x':
      gifFile.finish();
      break;
    */
    default:
      break;
  }
}

void mousePressed(){
  helpScreen = false;
}
