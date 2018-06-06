public class BubbleBlock {
  private float x, y, radius1, radius2, direction;
  private color c;

  public BubbleBlock(float x, float y, float radius, float direction, color c) {
    this.x = x;
    this.y = y;
    this.radius1=radius;
    this.radius2=radius;
    this.direction = direction;
    this.c = c;
  }
  
  public BubbleBlock(float x, float y, float radius1, float radius2, float direction, color c) {
    this.x = x;
    this.y = y;
    this.radius1=radius1;
    this.radius2=radius2;
    this.direction = direction;
    this.c = c;
  }
  
  public void display() {
    fill(c);
    strokeWeight(2);
    stroke(255,240);
    ellipse(x, y, radius1*2, radius2*2);
    noStroke();
    fill(255, 40);
    ellipse(x+0.6*radius1*cos(direction+PI/6), y+0.6*radius2*sin(direction+PI/6), (1.0/3)*radius1, (1.0/3)*radius2);
    ellipse(x+0.6*radius1*cos(direction+PI/2.5), y+0.6*radius2*sin(direction+PI/2.5), (1.0/4)*radius1, (1.0/4)*radius2);
    fill(255, 190);
    ellipse(x+0.65*radius1*cos(direction+7*PI/6), y+0.65*radius2*sin(direction+7*PI/6), (1.0/3)*radius1, (1.0/3)*radius2);
    ellipse(x+0.65*radius1*cos(direction+3.5*PI/2.5), y+0.65*radius2*sin(direction+3.5*PI/2.5), (1.0/4)*radius1, (1.0/4)*radius2);
  }
}
