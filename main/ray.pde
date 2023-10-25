class Ray
{
  private PVector origin;
  private PVector direction;
  
  Ray(PVector origin, PVector direction)
  {
    this.origin = origin;
    this.direction = PVector.div(direction,direction.mag());
  }
  
  PVector at(float t)
  {
    return PVector.add(this.origin,PVector.mult(this.direction,t));
  }
  
  public PVector getOrigin()
  {
    return this.origin;
  }
  public PVector getDirection()
  {
    return this.direction;
  }
  
  public PVector getPoint(float t)
  {
    return PVector.add(this.getOrigin(),PVector.mult(this.getDirection(),t));
  }
}
