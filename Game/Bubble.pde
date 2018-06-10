public class Bubble {

  private float x, y, radius;
  private boolean isCleared;
  private BubbleBlock block;

  public Bubble(float x, float y, float radius) {
    this.x=x;
    this.y=y;
    this.radius=radius;
    isCleared = false;
    block = new BubbleBlock(x, y, radius, 0, color(20, 54, 129));
  }

  public void display() {
    block = new BubbleBlock(x, y, radius, 0, color(20, 54, 129));
    block.display();
  }

  public void move(float dx, float dy) {
    float angle = atan2(dy-y, dx-x);
    float dist = dist(dx,dy,x,y);
    if (dist < 50) {
      x += 10*cos(angle);
      y += 10*sin(angle);
    } else if (dist < 150) {
      x += 5*cos(angle);
      y += 5*sin(angle);
    }
    else if (isCleared){
      x += 12*cos(angle);
      y += 12*sin(angle);
    }
    if (dist(x, y, 0, 0)>1000-radius) {
      x = 1000 * cos(atan2(y, x));
      y = 1000 * sin(atan2(y, x));
    }
  }
  
  public float getX(){
    return x;
  }
  
  public float getY(){
   return y;
  }
  
  public float getRadius(){
     return radius; 
  }
  
  public void setClearState(boolean b){
     isCleared = b; 
  }
}
