class Dielectric implements Material
{
  private float refractiveIndex; 
  private color tint;
  Dielectric(float refractiveIndex)
  {
    this.refractiveIndex = refractiveIndex;
    this.tint = color(1,1,1);
  }
  Dielectric(float refractiveIndex, color tint)
  {
    this.refractiveIndex = refractiveIndex;
    this.tint = tint;
  }
  public MaterialHit scatter(Ray in, HitRecord record)
  {
    float refractionRatio;
    Ray scattered;
    float cosTheta = record.getNormal().dot(in.getDirection());
    if(cosTheta < 0)
    {
      refractionRatio = this.refractiveIndex;
    }
    else
    {
      refractionRatio = 1/this.refractiveIndex;
    }
    PVector refracted = refract(in.getDirection(),record.getNormal(), cosTheta, refractionRatio);
    scattered = new Ray(record.getPoint(), refracted);
    return new MaterialHit(scattered,tint);
  }
  private PVector refract(PVector inDirection,  PVector normal, float cosTheta, float refractionRatio)
  {
    
    float sinTheta = sqrt(1 - cosTheta * cosTheta);
    float sinThetaP = 1/refractionRatio * sinTheta;
    if(sinThetaP > 1)// || reflectance(cosTheta,refractionRatio) > random(1))
    {
      PVector reflected  = reflect(inDirection,normal); 
      return reflected;
    }
    else
    {
      PVector refPerp =  PVector.mult((PVector.sub(inDirection,PVector.mult(normal,cosTheta))),1/refractionRatio);
      PVector refPar =  PVector.mult(normal,cosTheta/abs(cosTheta) * sqrt(abs(1 - refPerp.magSq())));
      PVector refracted = PVector.add(refPerp, refPar);
      return refracted;
    }
    
  }
  
  private float reflectance(float cosTheta, float refractionRatio)
  {
    //using Schlick's approximation
    float r0 = pow((1 - refractionRatio)/(1 + refractionRatio),2);
    return r0 + (1-r0) * pow(1 - cosTheta,5);
  }
}
