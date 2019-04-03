import java.awt.Toolkit;
import java.awt.event.KeyEvent;
import peasy.*;
PeasyCam cam;

int state = 0; 
String result="";
String [] lines;
String [][] arrayFile;
ArrayList<atom> atoms;
ArrayList<connection> connections;
boolean loaded = false;
boolean drawn = false;
int mode = 0;
int Hmode = 0;
int Smode = 0;
void setup() { 
  fullScreen(P3D);
  cam = new PeasyCam(this, 1000, 550, 0, 500);
  atoms = new ArrayList<atom>();
  connections = new ArrayList<connection>();
}

void draw() { 
  background(0);
  DrawHud();
  stroke(255);
  noFill();
  translate(width/2, height/2);
  scale(10);
  DrawMolecule();
  DrawHud();
}






void checkSubmit() {
  switch (state) {
  case 0:
    fill(255);
    scale(2);
    text ("PDB code: \n"+result, 10, 10); 
    break;

  case 1:
    fill(255, 2, 2); 
    scale(2);
    text ("Selected: "+result, 10, 10);
    if (loaded == false) {
      try {
        lines = loadStrings("https://files.rcsb.org/view/"+result+".pdb");
        int length = lines.length;
        String arrayFiles[][] = new String[length][14];
        for (int i = 0; i< lines.length; i++) {
          arrayFiles[i] = splitTokens(lines[i]);
        }
        for (int i = 0; i<arrayFiles.length; i++) {
          if (arrayFiles[i].length > 11) {
            if (arrayFiles[i][0].equals("ATOM")||arrayFiles[i][0].equals("HETATM")) {
              atoms.add(new atom(arrayFiles[i][0], int(arrayFiles[i][1]), arrayFiles[i][11], arrayFiles[i][3], arrayFiles[i][2], float(arrayFiles[i][6]), float(arrayFiles[i][7]), float(arrayFiles[i][8]), arrayFiles[i][4]));
            } 
          }
          else if (arrayFiles[i][0].equals("CONECT")) {
            int[] partners = new int[arrayFiles[i].length-2];
            for (int j = 2; j<arrayFiles[i].length; j++) {
              partners[j-2]= int(arrayFiles[i][j]);
            }
            connections.add(new connection(int(arrayFiles[i][1]),partners));
          }
        }
      }
      catch(Exception e) {
        println(e);
      }
      loaded = true;
    }
    if (lines!= null) {
      text ("Loaded correctfully", 10, 25);
    } else {
      text ("Not a valid PDB code!", 10, 25);
    }
    break;
  }
}
