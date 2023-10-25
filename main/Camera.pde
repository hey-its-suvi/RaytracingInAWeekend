class Camera
{
  private PVector origin;
  private PVector horizontal;
  private PVector vertical;
  private PVector lowerLeftCorner;
  
  public PVector lookFrom = new PVector(-2,2,1);
  public PVector lookAt = new PVector(0,0,-1);
  public PVector vUp = new PVector(0,1,0);
  
  public float verticalFOV = 25;
  public float aspectRatio = 16.0/9;
  public float viewportHeight = 2.0 * tan(radians(verticalFOV/2));
  public float viewportWidth = aspectRatio * viewportHeight;
  public float focalLength = 1;
  public int samplesPerPixel = 100;
  
  Camera()
  {
    this.origin = lookFrom;
    PVector w = PVector.sub(lookFrom,lookAt).normalize();
    PVector u = (vUp.cross(w)).normalize();
    PVector v = w.cross(u);
    this.horizontal = PVector.mult(u,viewportWidth);
    this.vertical = PVector.mult(v,viewportHeight);
    this.lowerLeftCorner = PVector.sub(origin,PVector.add(PVector.add(PVector.mult(horizontal,0.5),PVector.mult(vertical,0.5)),w));
  }
  
  Ray getRay(float u, float v)
  {
    return new Ray(origin,PVector.sub(PVector.add(lowerLeftCorner,PVector.add(PVector.mult(horizontal,u),PVector.mult(vertical,v))),origin));
  }
}
