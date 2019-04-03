class atom {
  String AtomSort;
  int AtomID;
  String AType;
  String AminoAcid;
  String SubType;
  float X;
  float Y;
  float Z;
  String Chain;
  atom(String AtomSort, int AtomID, String type, String AminoAcid, String subtype, float x, float y, float z, String chain) {
    this.AtomID = AtomID;
    this.AType = type;
    this.AminoAcid = AminoAcid;
    this.SubType = subtype;
    this.X=x;
    this.Y=y;
    this.Z=z;
    this.Chain = chain;
    this.AtomSort = AtomSort;
  }
}

class connection {
  int mainAtom;
  int[] bindAtoms;
  connection(int main,int[] bind) {
    bindAtoms = new int[bind.length];
    this.mainAtom=main;
    this.bindAtoms=bind;    
  }
}
