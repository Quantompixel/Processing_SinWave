class Vector3 {
  public float x;
  public float y;
  public float z;

  public Vector3(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  

  public float getMax(){
    if(this.x > this.y && this.x > this.z){
      return this.x;
    }
    else if(this.y > this.x && this.y > this.z){
      return this.y;
    }
    else{
      return this.z;
    }
  } 
  
  
  public float getMin(){
    if(this.x <this.y && this.x < this.z){
      return this.x;
    }
    else if(this.y < this.x && this.y < this.z){
      return this.y;
    }
    else{
      return this.z;
    }
  }  
}
