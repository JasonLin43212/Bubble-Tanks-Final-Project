  public class BubbleBullet {
  float x, y, speed, direction, radius, tankRadius;
  int id;
  BubbleBlock block;

  public BubbleBullet(float radius, float speed, float tankRadius, float x, float y, float direction, int id) {
    this.direction = direction;
    this.x = x+cos(direction)*tankRadius;
    this.y = y+sin(direction)*tankRadius;
    this.radius = 20;
    this.speed = speed;
    this.id=id;
    this.tankRadius = tankRadius;
    
  }

  public boolean move() {
    x += cos(direction) * speed;
    y += sin(direction) * speed;
    if (dist(x, y, 0, 0)>750-radius) {
      return false;
    }
    return true;
  }

  public void display() {
    block = new BubbleBlock(x,y,radius,direction,color(195,144,163));
    block.display();
  }

  public String toString() {
    return x + "  " + y;
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
  
  public int getId(){
     return id; 
  }
}
