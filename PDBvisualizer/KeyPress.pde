void keyPressed() {
  if (key==ENTER||key==RETURN) {
    if (state == 0) {
      state++;
    } else if (state == 1) {
      state--;
      atoms=null;
      loaded = false;
    }
  } else if (key == BACKSPACE && state == 0 && result.length()>0) {
    result = result.substring(0, result.length() -1);
  } else if (key == 'M' || key == 'm') {
    mode++;
    if (mode > 2) {
      mode =0;
    }
  } else if (key == 'H' || key == 'h') {
    Hmode++;
    if (Hmode > 2) {
      Hmode =0;
    }
  } else if (key == 'S' || key == 's') {
    Smode++;
    if (Smode > 1) {
      Smode =0;
    }
  } else if (state ==0 && keyCode != KeyEvent.VK_SHIFT  && keyCode != KeyEvent.VK_CONTROL && keyCode != KeyEvent.VK_TAB && keyCode != KeyEvent.VK_CAPS_LOCK && keyCode != KeyEvent.VK_ALT) {
    result = result + key;
  }

    if (result != null &&result.length()==0) {
      result = null;
      atoms = null;
    }
  
}
