public class TitleBubble{
   private float x,y,yspeed,radius;
   
   public TitleBubble(float x, float yspeed, float radius){
      this.x = x;
      this.y = height+40;
      this.yspeed = yspeed;
      this.radius = radius;
   }
   
   public boolean move(){
      this.y -= yspeed;
      if (y < -radius){
         return true; 
      }
      return false;
   }
   
   public void display(){
     fill(140,204,250);
     noStroke();
     ellipse(x,y,2*radius,2*radius); 
   }
}
