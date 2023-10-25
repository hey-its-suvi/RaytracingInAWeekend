class MaterialHit
{
  private Ray scattered;
  private color attenuation;
  
  MaterialHit(Ray scattered, color attenuation)
  {
    this.scattered = scattered;
    this.attenuation = attenuation;
  }
  
  public Ray getScattered()
  {
    return this.scattered;
  }
  
  public color getAttenuation()
  {
    return this.attenuation;
  }
}
