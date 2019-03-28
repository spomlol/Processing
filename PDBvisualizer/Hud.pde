void DrawHud() {
  cam.beginHUD();
  fill(125);
  noStroke();
  rect(0, 0, width, height/20);
  stroke(255);
  line(300, 0, 300, height/20);
  line(600, 0, 600, height/20);
  line(900, 0, 900, height/20);
  line(1200, 0, 1200, height/20);
  checkSubmit();
  
  //Atoms mode
  text ("Mode: ", 155, 10);
   switch (mode){
     case 0:
       text ("Spheres", 155, 25);
       break;
     case 1:
       text ("Lines", 155, 25);
       break;
     case 2:
       text ("Hide", 155, 25);
       break;
   }
  //HETATMS MODE
  text ("HETATM Mode: ", 305, 10);
    switch (Hmode){
     case 0:
       text ("Hide", 305, 25);
       break;
     case 1:
       text ("Show spheres", 305, 25);
       break;
     case 2:
       text ("Show sticks", 305, 25);
       break;
   }
   text ("Sidechain Mode: ", 455, 10);
    switch (Smode){
     case 0:
       text ("Hide", 455, 25);
       break;
     case 1:
       text ("Show", 455, 25);
       break;
   }
  cam.endHUD();
}
