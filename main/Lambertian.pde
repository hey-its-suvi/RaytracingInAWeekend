class Lambertian implements Material
{
  private color albedo;
  Lambertian(color c)
  {
    this.albedo = c;
  }
  
  public MaterialHit scatter(Ray in, HitRecord record)
  {
    PVector scatterDirection = PVector.add(record.getNormal(), randomUnitVector());
    if(scatterDirection.mag() < 0.000001)
    {
      scatterDirection = record.getNormal();
    }
    Ray scattered = new Ray(record.getPoint(), scatterDirection);
    return new MaterialHit(scattered, this.albedo);
    
  }
}
