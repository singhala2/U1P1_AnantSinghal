//sound library import
import processing.sound.*;

//background color variable to enable fades
int backgroundColor = 255;
//x-origin - centre of the window
float xo;
//y-origin see above
float yo;
//circle diameter to avoid hard coding
float dia = 50;
//ellipse X position
float ellipseX = 0;
//ellipse Y position
float ellipseY = 0;
//Same as above for second ellipse
float ellipse2X = 0;
float ellipse2Y = 0;
//Same for third ellipse
float ellipse3X = 0;
float ellipse3Y = 0;
//speed of ellipse 1
float speedX = random(5, 15);
float speedY = random(5, 15);
//speed of ellipse 2
float speed2X = random(5, 15);
float speed2Y = random(5, 15);
//speed for ellipse 3
float speed3X = random(5, 15);
float speed3Y = random(5, 15);
//screen zoom in and zoom out. default = 1.
float zoom = 1;
//angle of origin to enable rotation
float angle = 0;
//album cover image
PImage GlassAnimals;
//code for mp3 file to play
SoundFile file;
String audioName = "CaneShuga.mp3";
String path;

void setup()
{
  size(800, 800);
  xo = width/2; // xo is always centre
  yo = height/2; // yo is always centre
  colorMode(HSB, 360, 100, 100); //change color mode from RBG to HSB to enable fades
  GlassAnimals = loadImage("GlassAnimals.jpg");//album cover image load
  path = sketchPath(audioName);
  file = new SoundFile(this, "CaneShuga.mp3");
  file.play();

}

void draw()
{
  backgroundColor--;
  if (backgroundColor==0)backgroundColor=360;
  background(backgroundColor, backgroundColor, backgroundColor);
  scale(zoom);
  translate(xo, yo);
  rotate(angle);

  noStroke();
  fill(backgroundColor +- 100, backgroundColor +- 100, backgroundColor +- 100);
  quad(100, 0, 0, 100, 200, 400, 400, 200);
  fill(backgroundColor +- 100, backgroundColor +- 100, backgroundColor +- 100);
  ellipse(0, 0, dia + 250, dia + 250);
  fill(backgroundColor +- 10, backgroundColor +- 210, backgroundColor +- 80);
  rect(-50, -50, 100, 100);
  fill(backgroundColor +- 20, backgroundColor +- 40, backgroundColor +- 45);
  ellipse(ellipseX, ellipseY, dia, dia);
  {
    ellipseX = ellipseX + speedX;
    ellipseY = ellipseY + speedY;
    fill(backgroundColor +- 150, backgroundColor +- 80, backgroundColor +- 30);
    ellipse(ellipse2X, ellipse2Y, dia, dia);
    {
      ellipse2X = ellipse2X + speed2X;
      ellipse2Y = ellipse2Y + speed2Y;
    }
    fill(backgroundColor +- 50, backgroundColor +- 80, backgroundColor +- 50);
    ellipse(ellipse3X, ellipse3Y, dia, dia);
    {
      ellipse3Y = ellipse3Y + speed3Y;
      ellipse3X = ellipse3X + speed3X;
    }
    GlassAnimals.resize(100,100);
    image(GlassAnimals,-50, -50);
  }
  if (ellipseX > 800){
    speedX = speedX - 2*speedX;
  }
  if (ellipseY > 800){
    speedY = speedY - 2*speedY;
  }
  if (ellipse2X > 800){
    speed2X = speed2X - 2*speed2X;
  }
  if (ellipse2Y > 800){
    speed2Y = speed2Y - 2*speed2Y;
  }
  if (ellipse3X > 800){
    speed3X = speed3X - 2*speed3X;
  }
  if (ellipse3Y > 800){
    speed3Y = speed3Y - 2*speed3Y;
  }
    if (ellipseX < -800){
    speedX = speedX - 2*speedX;
  }
  if (ellipseY < -800){
    speedY = speedY - 2*speedY;
  }
  if (ellipse2X < -800){
    speed2X = speed2X - 2*speed2X;
  }
  if (ellipse2Y < -800){
    speed2Y = speed2Y - 2*speed2Y;
  }
  if (ellipse3X < -800){
    speed3X = speed3X - 2*speed3X;
  }
  if (ellipse3Y < -800){
    speed3Y = speed3Y - 2*speed3Y;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      zoom += .03;
    }
    if (keyCode == DOWN) {
      zoom -= .03;
    }
    if (keyCode == RIGHT) {
      angle += .05;
    }
    if (keyCode == LEFT) {
      angle -= .05;
    }
  }
  if (key == ' ') {
    angle = 0;
    zoom = 1;
    xo = width/2;
    yo = height/2;
    ellipseX = 0;
    ellipseY = 0;
    ellipse2X = 0;
    ellipse2Y = 0;
    ellipse3X = 0;
    ellipse3Y = 0;
  }
}

void mouseDragged() {
  xo = xo + (mouseX - pmouseX);
  yo = yo + (mouseY - pmouseY);
}

void mouseClicked() {
}
