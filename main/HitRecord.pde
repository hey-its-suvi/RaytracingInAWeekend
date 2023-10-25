class HitRecord
{
  private PVector point;
  private PVector  normal;
  private float t;
  Material mat;
  
  
  HitRecord(PVector point, PVector outwardNormal, float t, Material mat)
  {
    this.point = point;
    this.t = t;
    this.normal = PVector.div(outwardNormal,outwardNormal.mag());
    this.mat = mat;
  }
  
  public PVector getPoint()
  {
    return this.point;
  }
  public PVector getNormal()
  {
    return this.normal;
  }
  public float gett()
  {
    return this.t;
  }
  
}
