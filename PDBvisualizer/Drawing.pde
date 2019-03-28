void DrawMolecule() {
  if (loaded == true && atoms != null) {
    String chain = "A";
    atom prevatom = atoms.get(0);
    int CA = 0;
    int N = 0;
    beginShape();
    for ( int i = 0; i<atoms.size(); i++) {
      atom a = atoms.get(i);
      if (!chain.equals(a.Chain)) {
        endShape();
        beginShape();
        chain = a.Chain;
      }
      determineColor(a);

      if (a.AtomSort.equals("ATOM")) {
        if (a.SubType.equals("CA")|| a.SubType.equals("C")||a.SubType.equals("N")) {
          if (a.SubType.equals("CA")) {
            CA= i;
          }
          if (a.SubType.equals("N")) {
            N= i;
          }
          switch (mode) {
          case 0:
            point(a.X, a.Y, a.Z);
            break;
          case 1:
            vertex(a.X, a.Y, a.Z);
            break;
          case 2:
            break;
          }
        } else if (a.SubType.equals("O")) {
          switch (mode) {
          case 0:
            point(a.X, a.Y, a.Z);
            endShape();
            beginShape();
            point(prevatom.X, prevatom.Y, prevatom.Z);
            break;
          case 1:
            vertex(a.X, a.Y, a.Z);
            endShape();
            beginShape();
            vertex(prevatom.X, prevatom.Y, prevatom.Z);
            break;
          case 2:
            break;
          }
          if (Smode == 1) {
            drawResidue(i, CA, N);
          }
        }
      } else if (a.AtomSort.equals("HETATM")) {
        if (Hmode ==1) {
          point(a.X, a.Y, a.Z);
        }
      }
      prevatom = a;
    }
    endShape();
    if (Hmode==2) {
      for (connection c : connections) {
        for (atom a : atoms) { 
          if (a.AtomID == c.mainAtom) {
            for (int ID = 0; ID < c.bindAtoms.length; ID++) {
              for (atom at : atoms) { 
                if (at.AtomID == c.bindAtoms[ID]) {
                  determineColor(at);
                  line(a.X, a.Y, a.Z, at.X, at.Y, at.Z);
                  break;
                }
              }
            }
            break;
          }
        }
      }
    }
  }
}





void determineColor(atom a) {
  switch(a.AType) {
  case "C" :
    stroke(255, 140, 0, 100);
    break;
  case "N" :
    stroke(0, 0, 255, 100);
    break;
  case "O" :
    stroke(255, 0, 0, 100);
    break;
  case "S" :
    stroke(255, 255, 0, 100);
    break;
  default:
    stroke(255, 255, 255, 100);
    break;
  }
}

void drawResidue(int i, int CA, int N) {
  atom Sres = atoms.get(i);
  atom Pres = atoms.get(CA);
  atom Cres = atoms.get(i+1);
  endShape();

  switch (Cres.AminoAcid) {
  case "HIS":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    stroke(0, 0, 255, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+2);
    Cres = atoms.get(i+4);
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+3);
    Cres = atoms.get(i+5);
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+4);
    Cres = atoms.get(i+6);
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+5);
    Cres = atoms.get(i+6);
    stroke(0, 0, 255, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "TRP":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+4);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+3);
    Cres = atoms.get(i+5);
    stroke(0, 0, 255, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+5);
    Cres = atoms.get(i+6);
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+4);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+8);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+10);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+9);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+7);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+4);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "PHE":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+4);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+3);
    Cres = atoms.get(i+5);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+4);
    Cres = atoms.get(i+6);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+7);
    Cres = atoms.get(i+6);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+5);
    Cres = atoms.get(i+7);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;    
  case "VAL":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+3);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "SER":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    stroke(255, 0, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "CYS":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    stroke(255, 255, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "ALA":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "TYR":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+5);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+7);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+8);
    stroke(255, 0, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+6);
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+4);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "LEU":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+4);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "ILE":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+3);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+4);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "MET":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    stroke(255, 255, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+4);
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "PRO":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(N);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "THR":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    stroke(255, 0, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+3);
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "GLU":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Pres = atoms.get(i+4);
    stroke(255, 0, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+5);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "GLN":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Pres = atoms.get(i+4);
    stroke(255, 0, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = atoms.get(i+5);
    stroke(0, 0, 255, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "ASP":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    stroke(255, 0, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+4);
    stroke(255, 0, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "ASN":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    stroke(255, 0, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+4);
    stroke(0, 0, 255, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "ARG":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+4);
    stroke(0, 0, 255, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+5);
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+6);
    stroke(0, 0, 255, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Cres = atoms.get(i+7);
    stroke(0, 0, 255, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  case "LYS":
    stroke(255, 140, 0, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+2);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+3);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+4);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    Pres = Cres;
    Cres = atoms.get(i+5);
    stroke(0, 0, 255, 100);
    line(Pres.X, Pres.Y, Pres.Z, Cres.X, Cres.Y, Cres.Z);
    break;
  }

  beginShape();
  vertex(Sres.X, Sres.Y, Sres.Z);
}
