ArrayList<drawing> path;
ArrayList<drawing> path2;
boolean Done=false;
float time=0;
float fourier[][];

void setup() {
  fullScreen();
  path = new ArrayList<drawing>();
  path2 = new ArrayList<drawing>();
}

void draw() {
  background(0);
  stroke(255);
  beginShape();
  noFill();
  if (Done==false) {
    for (int i = 0; i < path.size(); i++) {
      drawing p = path.get(i);
      vertex(p.x, p.y);
    }
  }
  else if (Done==true) {
    float point[] = epicycles(width/2, height/2, 0, fourier);
    float x = point[0];
    float y = point[1];
    path2.add(new drawing(x,y));
    for (int i = 0; i < path2.size(); i++) {
      drawing p = path2.get(i);
      stroke(255);
      vertex(p.x, p.y);
    }    
    float dt = TWO_PI / fourier.length;
    time += dt;
  }
  endShape();
  if (time > TWO_PI) {
    time =0;
  }
}

class drawing {
  float x;
  float y;
  drawing(float x, float y){
   this.x = x;
   this.y = y;
  }
}

void mouseDragged() {
  if (Done==false) {
   path.add(new drawing(mouseX,mouseY)); 
  }
  else {
    Done= false;
  }
}
void mouseReleased() {
 drawing p = path.get(0);
 path.add(new drawing(p.x,p.y));
 Done = true;
 Complex x[] = new Complex[path.size()];
 for (int i=0; i<path.size();i++){
   p = path.get(i);
   x[i] = new Complex(p.x,p.y);
 }
   fourier = dft(x);
}

class Complex {
  float re;
  float im;
  
  Complex(float a, float b) {
    this.re = a;
    this.im = b;
  }

  Complex addC(Complex c) {
    this.re += c.re;
    this.im += c.im;
    return this;
  }

  Complex multC(Complex c) {
    float re = this.re * c.re - this.im * c.im;
    float im = this.re * c.im + this.im * c.re;
    return new Complex(re, im);
  }
}


float[][] dft(Complex x[]) {
  int N = x.length;
  float X[][] = new float[N][5];
  for (int k = 0; k < N; k++) {
    Complex sum = new Complex(0, 0);
    for (int n = 0; n < N; n++) {
      float phi = (TWO_PI * k * n) / N;
      Complex c = new Complex(cos(phi), -sin(phi));
      sum = sum.addC(x[n].multC(c));
    }
    sum.re = sum.re / N;
    sum.im = sum.im / N;

    int freq = k;
    float amp = sqrt(sum.re * sum.re + sum.im * sum.im);
    float phase = atan2(sum.im, sum.re);
    X[k][0] = sum.re;
    X[k][1] =  sum.im;
    X[k][2] = freq;
    X[k][3] = amp;
    X[k][4] = phase;
  }
  return X;
}

float[] epicycles(float x, float y, float rotation, float fourier[][]) {
  for (int i = 1; i < fourier.length; i++) {
    float prevx = x;
    float prevy = y;
    float freq = fourier[i][2];
    float radius = fourier[i][3];
    float phase = fourier[i][4];
    x += radius * cos(freq * time + phase + rotation);
    y += radius * sin(freq * time + phase + rotation);
    stroke(255, 100);
    noFill();
    ellipse(prevx, prevy, radius * 2, radius*2);
    stroke(color(255,0,0),255);
    line(prevx, prevy, x, y);
  }
  float point[] = {x,y};
  return point;
}
