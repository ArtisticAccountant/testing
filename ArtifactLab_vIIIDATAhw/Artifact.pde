float x1, x2, a;

public class Artifact{

  ArrayList<Vert> vertices;
  PVector position;
  PVector rotation;
  PVector scale;
  PVector p;

//  Minim minim;
//AudioPlayer groove;

  Artifact(){
    // set initial transformtaions
    position = new PVector(0,0,0);
    rotation = new PVector(0,0,0);
    scale = new PVector(1.,1.,1.);
    vertices = new ArrayList<Vert>();
    
       
    setup();
  }

  ////////////////////////
  // METHODS
  //////////////////////

  public void setup(){
    // create/empty the arrayList
    vertices = new ArrayList<Vert>();

    //create a single vertex
    pushVert(0,0,0);
    pushVert(0,0,100);
  }

  public void update() {
    // update all vertices
    for(int i = 0; i < vertices.size();i++){
      vertices.get(i).update();
    }
  }

  // draws all vertices using LINE_STRIP to a provided PGraphics object
  public void draw(PGraphics pg){

    pushTransform(pg);
    //draw all vertices
    pg.beginShape(POINTS);
    for(int i = 0; i < vertices.size();i++){
      p = vertices.get(i).position;
      pg.vertex(p.x*x1, p.y*x2, p.z); 
        x1 = groove.left.get(10)+groove.right.get(10); 
   x2 = map(x1, 0, 1, 0, 10);
   float x3 = map(x1, 0, 1, 0, 10);
   position.z = x2; 
   position.x = x3; 
    }
    
    pg.endShape();

    popTransform(pg);
  }

  public void pushTransform(PGraphics pg){
    // perform all transformations
    pg.pushMatrix();
    pg.translate(position.x, position.y, position.z);
    pg.rotateX(rotation.x);
    pg.rotateY(rotation.y);
    pg.rotateZ(rotation.z);
    pg.scale(scale.x, scale.y, scale.z);
  }

  // pop out of all transformations
  public void popTransform(PGraphics pg){
      pg.popMatrix();
  }

  // Push vertices to arraylist
  // Version A - vector
  public void pushVert(PVector v){
    vertices.add(new Vert(v.x,v.y,v.z));
  }
  //// Version B - 3 floats
  public void pushVert(float x, float y, float z){
    vertices.add(new Vert(x,y,z));
  }

} // END class Artifact











//