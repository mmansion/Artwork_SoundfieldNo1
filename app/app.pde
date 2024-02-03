/* App Objects
  ------------------------------ */
UdpSender udpSender;


Particle[] windParticles;
boolean SHOW_PARTICLES = true;
boolean SHOW_RANGE = true;

Grid grid;

PGraphics pg;
int numParticles = 200;
float boost = 10.0;
int range = 5; // particle dist to point to activate

int ledSize = 4;
float noiseScale = 0.01/4; // increase divisor for change in pattern

CanvasCam cam;
void settings() {
    size(UNIT_SIZE*GRID_COLS + GRID_BORDER_MARGIN, UNIT_SIZE*GRID_ROWS + GRID_BORDER_MARGIN);
}

void setup() {
  
  background(0);
  windParticles = new Particle[numParticles];
  for (int i = 0; i < numParticles; i++) {
    windParticles[i] = new Particle();
  }
  ellipseMode(CENTER);
  clear();
 
  pg = createGraphics(GRID_ROWS * UNIT_SIZE, GRID_COLS * UNIT_SIZE);
  
  // creates new tile grid according to config/TILE_ARRANGEMENT
  grid = new Grid(); 
  
  cam = new CanvasCam(this);
  
}
// 1 = grid dev
// 2 = tile dev
int MODE = 1;
int inc = 0;
int wait_posFrame = 2000;
int wait_buildGrid = 4000;
void draw() { 
  
  if(millis() > wait_posFrame) {
    
    if(MODE == 1) {
      background(0);
      grid.update();
      grid.displayVectors();
      grid.display();
      
      stroke(255);
      if(SHOW_PARTICLES && millis() > wait_buildGrid) {
        for (int i = 0; i < numParticles; i++) {
          windParticles[i].update2();
          windParticles[i].display();
        }
      } 
    }
  }
}
void mousePressed() {
  
}

void mouseReleased() {
  noiseSeed(millis());
}
