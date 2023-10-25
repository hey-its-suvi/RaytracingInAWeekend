class Sphere implements Hittable
{
  private PVector center;
  private float radius;
  private Material mat;
  
  Sphere(PVector center, float radius, Material mat)
  {
    this.center = center;
    this.radius = radius;
    this.mat = mat;
  }
  
  
  public HitRecord hit(Ray r, float t_min, float t_max)
  {
    PVector centerToRayOrigin = PVector.sub(r.getOrigin(),this.center);
    
    // a,b,c of quadratic eqn
    float a = r.getDirection().magSq();                  //will always be 1, added for clarity
    float b = 2 * r.getDirection().dot(centerToRayOrigin);
    float c = centerToRayOrigin.magSq() - pow(this.radius,2);
    
    float discriminant = pow(b,2) - 4*a*c;
    
    HitRecord record;
    if(discriminant < 0)
    {
       record = null;
    }
    else
    {
      float discSqrt = sqrt(discriminant);
      float root1 = (-b - discSqrt)/(2*a);
      float root2 = (-b + discSqrt)/(2*a);
      
      if(t_min < root1 && root1 < t_max)
      {
        record = new HitRecord(r.at(root1),PVector.div(PVector.sub(r.at(root1),this.center),this.radius) ,root1,this.mat);
      }
      else if (t_min < root2 && root2 < t_max)
      {
        record = new HitRecord(r.at(root2),PVector.div(PVector.sub(r.at(root2),this.center),this.radius) ,root2, this.mat);
      }
      else
      {
        record = null;
      }
    }
    return record;
  }
  
}
