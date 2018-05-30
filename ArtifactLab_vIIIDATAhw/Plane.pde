
public class Plane extends Artifact{

  // PROPERTIES
  int wid;
  int hei;
  float scl;

  // CONSTRUCTOR
  Plane(){
    super();
  }

  // SETUP
  // override setup function to create a plane
  public void setup(){
    vertices = new ArrayList<Vert>();
    wid = 128;
    hei = 128;
    scl = 10;
    for(int i = 0; i < wid; i++){
      for(int j = 0; j < hei; j++){
        pushVert(i*scl - (wid*scl/2.0),
                 j*scl - (hei*scl/2.0),
                 0);
      }
    }
  }
} // END class Plane