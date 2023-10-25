color rayColor(Ray r, World world, int depth)
{
  if(depth ==0)
  {
    return color(0,0,0);
  }
  HitRecord hit = world.hit(r,0.001,Float.POSITIVE_INFINITY);
  if(hit!=null)
  {
    MaterialHit matHit = hit.mat.scatter(r,hit);
    if(matHit!=null)
    {
      color nextColor = rayColor(matHit.getScattered(),world,depth-1);
      float red =  red(matHit.getAttenuation()) * red(nextColor);
      float green =  green(matHit.getAttenuation()) * green(nextColor);
      float blue =  blue(matHit.getAttenuation()) * blue(nextColor);
      
      return color(red,green,blue);
    }
    else
    {
      return color(0,0,0);
    }
    
    //PVector target = PVector.add(hit.getNormal(), randomUnitVector());
    //Ray bounce = new Ray(hit.getPoint(), target);
    //return lerpColor(color(0,0,0), rayColor(bounce,world,depth-1),0.5);
  }
  else
  {
    float t = 1-0.5*(r.direction.y+1);
    return lerpColor(color(#FFFFFF),color(#0096FF),t);
  }
}

PVector randomInSphere()
{
  PVector result=  PVector.random3D();
  if(result.mag()<1)
  {
    return result;
  }
  else
  {
    return randomInSphere();
  }
}

PVector randomUnitVector()
{
  return randomInSphere().normalize(null);
}

PVector reflect(PVector v, PVector n)
{
  float bMag = PVector.dot(v,n);
  PVector b = PVector.mult(n,bMag);
  return PVector.sub(v,PVector.mult(b,2));  
}

color antiAliasing(int i, int j, Camera camera, World world)
{
  float red = 0;
  float green = 0;
  float blue = 0;
  
  for(int sample=0;sample<camera.samplesPerPixel;sample++)
  {
    float u = (float(i) + random(1))/imageWidth;
    float v = (float(j) + random(1))/imageHeight;
    Ray r = camera.getRay(u,v);
    
    color instance = rayColor(r, world, 20);
    red += red(instance);
    green+= green(instance);
    blue+= blue(instance);
  }
  float pixelRed=  sqrt(red/camera.samplesPerPixel);
  float pixelGreen = sqrt(green/camera.samplesPerPixel);
  float pixelBlue = sqrt(blue/camera.samplesPerPixel);
  return color(pixelRed, pixelGreen, pixelBlue);
  
  
  
}
