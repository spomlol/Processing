import java.util.Collections;
import java.util.*;

void crossbreed() {
  bestXever=0;
  bestXs.add(bestX);
  worstXs.add(worstX);
  for (float s : bestXs) {
    if (s>bestXever) {
      bestXever=s;
    }
  }
  worstXever=0;
  for (float s : worstXs) {
    if (s<worstXever) {
      worstXever=s;
    }
  }
  ArrayList<creature> pool  = new ArrayList<creature>();
  for (creature c : creatures) {
    for (int i=0; i<map(c.score, worstX, bestX, 0, 100)*10; i++) {
      pool.add(c);
    }
  }
  
  creatures = new ArrayList<creature>();
  if (pool.size() != 0) {

    for (int i=0; i<noCreatures*0.5; i++) {
      int r1 = floor(random(0, pool.size()));
      creature parent1 = pool.get(r1);
      float[][] DNA = new float[chromosomes][time];
      float[] lengths = new float[chromosomes];
      for (int j = 0; j<chromosomes; j++) {
        spring s = parent1.springs.get(j);
        lengths[j] = s.dist;
        if (random(0, 1)<mutation) {
          lengths[j]+=random(-15, 15);
          lengths[j] = constrain(lengths[j], 50,150);
        }

        for (int k = 0; k<time; k++) {
          DNA[j][k] = s.DNA[k];
          if (random(0, 1)<mutation) {
            DNA[j][k]+=random(-0.05, 0.05);
          }
        }
      }
      float[] frictions = new float[chromosomes];
      for (int j = 0; j<chromosomes; j++) {
        node n = parent1.nodes.get(j);
        frictions[j] = n.friction;
        if (random(0, 1)<mutation) {
          frictions[j]+=random(-1, 1);
          frictions[j]=constrain(frictions[j], 0, 1);
        }
      }
        for (int j = 0; j<chromosomes; j++) {
          node n = parent1.nodes.get(j);
          n.pos.set(0,300);
          n.vel.set(0,0);
          spring s = parent1.springs.get(j);
          s.Fa.set(0,0);
          s.Fb.set(0,0);
        }
      

      creature child = new creature(i, DNA, lengths, frictions);
      creatures.add(child);
      creatures.add(parent1);
    }
  } else {
    for (int i=0; i<noCreatures; i++) {
      creatures.add(new creature(i));
    }
  }
  timer=0;
  generation++;
}
