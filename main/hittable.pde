interface Hittable 
{
  public HitRecord hit(Ray r, float t_min, float t_max);
}
