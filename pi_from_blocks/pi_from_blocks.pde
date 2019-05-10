class System {
  private float m1, m2, p1, p2;
  
  public System(float m1, float m2, float p1, float p2) {
    this.m1 = m1;
    this.m2 = m2;
    this.p1 = p1;
    this.p2 = p2;
  }
  
  public boolean doNextCollision() {
    if (!hasNextCollision()) {
      return false;
    }
    if (p2 < 0) { // smaller block and wall
      p2 = -p2;
      return true;
    }
    // the two blocks
    float p1Prime = ((m1 - m2)*p1 + 2*m1*p2)/(m1 + m2);
    p2 = (2*m2*p1 + (m2 - m1)*p2)/(m1 + m2);
    p1 = p1Prime;
    return true;
  }
  
  private boolean hasNextCollision() {
    if (m2*p1 >= m1*p2 && m1*p2 >= 0) {
      return false;
    }
    return true;
  }
  
  public float getBlock1State() {
    return p1/sqrt((float) m1);
  }
  
  public float getBlock2State() {
    return p2/sqrt((float) m2);
  }
}

class StateSpaceGraph {
  float block1StatePrev, block2StatePrev;
  float centerX, centerY;
  float maxCoordinate;
  boolean usePrevious;
  
  public StateSpaceGraph(float maxCoordinate) {
    centerX = width/2;
    centerY = height/2;
    ellipse((float) centerX, (float) centerY, (float) min(width, height), (float) min(width, height));
    this.maxCoordinate = maxCoordinate;
    usePrevious = false;
  }
  
  public void plotState(float block1State, float block2State) {
    float scaleFactor = (float) (min(width, height)/2.0/maxCoordinate);
    float x = block1State*scaleFactor + centerX;
    float y = -block2State*scaleFactor + centerY;
    ellipse(x, y, 10.0, 10.0);
    if (usePrevious) {
      line(block1StatePrev*scaleFactor + centerX, -block2StatePrev*scaleFactor + centerY, x, y);
    }
    block1StatePrev = block1State;
    block2StatePrev = block2State;
    usePrevious = true;
  }
}
  

System sys;
StateSpaceGraph graph;
int collisions = 0;

void setup() {
  size(800, 600);
  background(255);
  stroke(0);
  sys = new System(100.0, 1.0, -1.0, 0.0);
  graph = new StateSpaceGraph(max((float) abs(sys.getBlock1State()), (float) abs(sys.getBlock2State())));
}

void draw() {
  graph.plotState(sys.getBlock1State(), sys.getBlock2State());

  if (sys.doNextCollision()) {
    collisions++;
  } else {
    noLoop();
    println("Number of collisions:", collisions);
  }
}