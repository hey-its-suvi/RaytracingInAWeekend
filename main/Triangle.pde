class Triangle implements Hittable
{
  PVector p1;
  PVector p2;
  PVector p3;
  PVector normal;
  float d;
  Material mat;
  
  Triangle(PVector p1, PVector p2, PVector p3, Material mat)
  {
    this.p1 = p1;
    this.p2 = p2;
    this.p3 = p3;
    this.mat = mat;
    this.normal = PVector.sub(p2,p1).cross(PVector.sub(p3,p1));
    normal.normalize();
    this.d = findD();
    
  }
  
  public HitRecord hit(Ray r, float t_min, float t_max)
  {
    float eps = 0.0001;
    HitRecord record;
    if(abs(normal.dot(r.getDirection())) < eps)
    {
      record = null;
    }
    else
    {
      float t = (-d - normal.dot(r.getOrigin()))/(normal.dot(r.getDirection()));
      if(t_min < t && t< t_max)
      {
        PVector i = r.getPoint(t); // intersection point
        PVector p1i = PVector.sub(i,p1);
        PVector p2i = PVector.sub(i,p2);
        PVector p13 = PVector.sub(i,p3);
        if(PVector.sub(p2,p1).cross(p1i).dot(PVector.sub(p3,p1).cross(p1i))<0 && PVector.sub(p1,p2).cross(p2i).dot(PVector.sub(p3,p2).cross(p2i))<0)
        {
          record = new HitRecord(i,normal,t,this.mat);
        }
        else
        {
          record = null;
        }
      }
      else
      {
        record = null;
      }
    }
    return record;
    
  }
  
  private float findD()
  {
    return -normal.dot(p1);
  }
}
