public class StunBullet extends BubbleBullet{
 
  private int stunTime;
  
   public StunBullet(float radius, float speed, float tankRadius, float x, float y, float direction, int id,int stunTime){
       super(radius, speed, tankRadius, x, y, direction, id);
       this.stunTime = stunTime;
       
   }
   
   public void display() {
     setBlock(new BubbleBlock(x, y, radius, direction, color(247, 237, 179)));
    getBlock().display();
  }
   
   public int getStunTime(){
      return stunTime; 
   }
   public String toString(){
      return "stun"; 
   }
}
