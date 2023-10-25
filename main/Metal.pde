  class Metal implements Material
{
  private color albedo;
  private float fuzz;
  
  Metal(color c)
  {
    this.albedo = c;
    this.fuzz=0;
    
  }
  Metal(color c, float fuzz)
  {
    this.albedo = c;
    this.fuzz=fuzz;
    
  }
  
  public MaterialHit scatter(Ray in, HitRecord record)
  {
    PVector reflected  = reflect(in.getDirection(), record.getNormal());
    PVector reflectedFuzz = PVector.add(reflected, PVector.mult(randomInSphere(),fuzz));
    Ray scattered = new Ray(record.getPoint(), reflectedFuzz);
    if(PVector.dot(scattered.getDirection(), record.getNormal()) > 0)
    {
      return new MaterialHit(scattered, this.albedo);
    }
    else
    {
      return null;
    }
  }
}
