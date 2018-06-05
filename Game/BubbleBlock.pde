  public class BubbleBlock {
  private float x, y, radius, direction;
  private color c;

  public BubbleBlock(float x, float y, float radius, float direction, color c) {
    this.x = x;
    this.y = y;
    this.radius=radius;
    this.direction = direction;
    this.c = c;
  }

  public void display() {
    fill(c);
    strokeWeight(2);
    stroke(195, 234, 250);
    ellipse(x, y, radius*2, radius*2);
    noStroke();
    fill(255, 40);
    ellipse(x+0.6*radius*cos(direction+PI/6), y+0.6*radius*sin(direction+PI/6), (1.0/3)*radius, (1.0/3)*radius);
    ellipse(x+0.6*radius*cos(direction+PI/2.5), y+0.6*radius*sin(direction+PI/2.5), (1.0/4)*radius, (1.0/4)*radius);
    fill(255, 190);
    ellipse(x+0.65*radius*cos(direction+7*PI/6), y+0.65*radius*sin(direction+7*PI/6), (1.0/3)*radius, (1.0/3)*radius);
    ellipse(x+0.65*radius*cos(direction+3.5*PI/2.5), y+0.65*radius*sin(direction+3.5*PI/2.5), (1.0/4)*radius, (1.0/4)*radius);
  }
}
