public class SuperBullet extends BubbleBullet{
   private int type,counter;
  
  public SuperBullet(float radius, float speed, float tankRadius, float x, float y, float direction, int id,int type){
     super(radius, speed, tankRadius, x, y, direction, id);
     this.type = type;
     counter = 70;
  }
  
  public void display(){
    //machinegun  
    if (type >1){
       setBlock(new BubbleBlock(x, y, radius, direction, color(195, 144, 163)));
     }
     if (type == 1){
       setBlock(new BubbleBlock(x, y, radius, direction, color(121, 114, 130)));
     }
     getBlock().display();
     counter--;
     if (counter <=0){
        spawnMore();
        counter = 70;
     }
  }
  
  public void spawnMore(){
    for (int i=0; i<20; i++){
       if (type == 1){
          allBullets.add(new MissileBullet(16, 7, radius, x, y, direction+i*PI/10, id)); 
       }
       if (type == 2){
          allBullets.add(new BubbleBullet(13, 7, radius, x, y, direction+i*PI/10, id)); 
          allBullets.add(new BubbleBullet(13, 7, radius, x, y, direction+i*PI/10+PI/20, id)); 
       }
       if (type == 3){
         allBullets.add(new BubbleBullet(22, 7, radius, x, y, direction+i*PI/10, id));
       }
    }
  }
  
  public String toString(){
     return "super"; 
  }
}
