int x, y;
PVector vector_z, vector_k, vector;

void setup() 
{
  size(displayWidth, displayHeight);
  smooth();
  ellipseMode(CENTER);
}

void draw() 
{
  background(0);
  noStroke();
  
  
  for(int i = 0; i < 256; i++) 
  {
    scale(4.0);
    fill(float(i));
    ellipse(135, 140, 256-i, 256-i);
    scale(0.25);
  }
  
  for(int i = 0; i < 44; i++)
  {
    scale(4.0);
    fill(float(3*i));
    ellipse(135, 386, 44-i, 44-i);
    scale(0.25);
  }
  
  float odleglosc_z = pow(pow((540-x), 2) + pow((560-y), 2), 0.5) * 390.65;
  float odleglosc_k = pow(pow((540-x), 2) + pow((1544-y), 2), 0.5) * 390.65;
  
  float masa_z = 5.972;
  float masa_k = 0.073;
  
  float G = 6.67;
  
  float gamma_z = (masa_z * G) / ((odleglosc_z / 100) * (odleglosc_z / 100)) * 1000;
  float gamma_k = (masa_k * G) / ((odleglosc_k / 100) * (odleglosc_k / 100)) * 1000;
  
  float stosunek_z = (odleglosc_z / 390.65) / gamma_z;
  float stosunek_k = (odleglosc_k / 390.65) / gamma_k;
  
  vector_z = new PVector((540-x) / stosunek_z, (560-y) / stosunek_z);
  vector_k = new PVector((540-x) / stosunek_k, (1544-y) / stosunek_k);
  vector = new PVector(vector_z.x + vector_k.x, vector_z.y + vector_k.y);
  
  float sila = pow(pow(vector.x, 2) + pow(vector.y, 2), 0.5);
  
  textSize(32);
  text("Odleglosc od Ziemii: ", 50, 1680);
  text(odleglosc_z, 355, 1680);
  
  text("Sila Ziemii: ", 50, 1730);
  text(nf(gamma_z, 1, 5), 365, 1730);
  
  text("Sila Ksiezyca: ", 50, 1780);
  text(nf(gamma_k, 1, 5), 365, 1780);
  
  text("Sila wypadkowa: ", 50, 1830);
  text(nf(sila, 1, 5), 365, 1830);
  
  fill(255);
  ellipse(x, y, 30, 30);
  stroke(255);
  line(x, y, x + (vector.x * 10000), y + (vector.y * 10000));
}

void mousePressed()
{
  x = mouseX;
  y = mouseY;
}
