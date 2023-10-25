float aspectRatio = 16.0/9;
int imageWidth = 800;
int imageHeight = round(imageWidth/aspectRatio);



void settings()
{
  size(imageWidth,imageHeight);
}

void setup() {
  colorMode(RGB, 1.0);
  
  //Camera
  Camera camera = new Camera();
  
  //intialise materials
  Material mat_ground = new Lambertian(color(0.8, 0.8, 0.0));
  Material mat_center = new Dielectric(1.5);
  Material mat_inside_center = new Lambertian(color(0,0,0.6));
  Material mat_left = new Metal(color(0, 0.9, 1), 0.3);
  Material mat_right = new Lambertian(color(1, 0.5, 0.7));
  Material mat_triangle = new Lambertian(color(0.5,0,0));
  
  //initialise world
  World world = new World();
  world.add(new Sphere(new PVector(0.0, -100.5, -1.0), 100, mat_ground));
  world.add(new Sphere(new PVector(0, 0, -1), 0.5, mat_center));
  world.add(new Sphere(new PVector(0, 0, -1), -0.48, mat_center));
  //world.add(new Triangle(new PVector(-1,   0.0, -1),new PVector(1,   0.0, -3),new PVector(0,   1, -1),mat_triangle));
  //world.add(new Triangle(new PVector(-1,   0.0, -1),new PVector(1,   0.0, -3),new PVector(0,  -0.1, -0.2),mat_triangle));
  world.add(new Sphere(new PVector(-1.0,  0.0, -1.0), 0.5, mat_left));
  world.add(new Sphere(new PVector(1.0,   0.0, -1.0), 0.5, mat_right));
  
  
  
  loadPixels();
  for(int j = 0;j<imageHeight ;j++)
  {
    println("Line "+j);
    for(int i=0;i<imageWidth ;i++)
    {
      pixels[i+(imageHeight-1-j)*imageWidth] = antiAliasing(i,j,camera,world);
    }
    
  }
  updatePixels();
  println("Done");
  
}
