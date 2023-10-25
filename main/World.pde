class World
{
  private ArrayList<Hittable> list; 
  World()
  {
    list = new ArrayList<Hittable>();
  }
  
  public void add(Hittable object)
  {
    this.list.add(object);
  }
  public HitRecord hit(Ray r, float t_min, float t_max)
  {
    HitRecord currRecord = null;
    HitRecord newRecord = null;
    for(Hittable obj: this.list)
    {
      newRecord = obj.hit(r, t_min, t_max);
      if(newRecord!=null)
      {
        t_max = newRecord.gett();
        currRecord = newRecord;
      }
    }
    return currRecord;
  }  
}
