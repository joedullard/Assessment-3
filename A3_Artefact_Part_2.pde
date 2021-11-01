Table table;
int[] OPercentage = new int[145], LPer = new int[145], GPer = new int[145], MPer = new int[145], FPer = new int[145], TPer = new int[145];
int r, overallavg, lesbian, gay, mbi, fbi, trans, l, g, m, f, t;
boolean group;

void setup() {
  size(600,500,P2D);
  smooth();
  frameRate(30);
  textSize(25);
  fill(0);
  group = true;
  table = loadTable("LGBT_Discrimination.csv", "header");
  r= 0;
  l = 0;
  g = 0;
  m = 0;
  f = 0;
  t = 0;
  for (TableRow row : table.findRows("None of the above", "answer")) {
    if (row.getInt("percentage") >= 0) {
      OPercentage[r] = row.getInt("percentage");
      r = r+1;
      if (new String("Lesbian").equals(row.getString("subset")) == true) {
        LPer[l] = row.getInt("percentage");
        l = l+1;
      }
      if (new String("Gay").equals(row.getString("subset")) == true) {
        GPer[g] = row.getInt("percentage");
        g = g+1;
      }
      if (new String("Bisexual men").equals(row.getString("subset")) == true) {
        MPer[m] = row.getInt("percentage");
        m = m+1;
      }
      if (new String("Bisexual women").equals(row.getString("subset")) == true) {
        FPer[f] = row.getInt("percentage");
        f = f+1;
      }
      if (new String("Transgender").equals(row.getString("subset")) == true) {
        TPer[t] = row.getInt("percentage");
        t = t+1;
      }
    }
  }
  int sum = 0;
  int total = 0;
  for (int i = 0; i < OPercentage.length; i++) {
    if (OPercentage[i] > 0) {
      sum = sum + OPercentage[i];
      total = total+1;
      overallavg = int(sum/total);
    }
  }
  sum = 0;
  total = 0;
  for (int i = 0; i < LPer.length; i++) {
    if (LPer[i] > 0) {
      sum = sum + LPer[i];
      total = total+1;
      lesbian = int(sum/total);
    }
  }
  sum = 0;
  total = 0;
  for (int i = 0; i < GPer.length; i++) {
    if (GPer[i] > 0) {
      sum = sum + GPer[i];
      total = total+1;
      gay = int(sum/total);
    }
  }
  sum = 0;
  total = 0;
  for (int i = 0; i < MPer.length; i++) {
    if (MPer[i] > 0) {
      sum = sum + MPer[i];
      total = total+1;
      mbi = int(sum/total);
    }
  }
  sum = 0;
  total = 0;
  for (int i = 0; i < FPer.length; i++) {
    if (FPer[i] > 0) {
      sum = sum + FPer[i];
      total = total+1;
      fbi = int(sum/total);
    }
  }
  sum = 0;
  total = 0;
  for (int i = 0; i < TPer.length; i++) {
    if (TPer[i] > 0) {
      sum = sum + TPer[i];
      total = total+1;
      trans = int(sum/total);
    }
  }
}

void draw() {
  if (group == true) {
    fill(240);
    rect(25,25,550,450,10);
    fill(0);
    textSize(25);
    text((str(100-overallavg)+"% of all LGBT+ people reported discrimination when trying to access heathcare services."),50,85,500,400);
    fill(100);
    ellipse(width/2,325,250,250);
    fill(204);
    arc(width/2,325,250,250,0,radians(overallavg));
    Checkbox(true);
  }
  if (group == false) {
    fill(240);
    rect(25,25,550,450,10);
    fill(0);
    textSize(25);
    text((str(100-trans)+"% of trans people reported discrimination when trying to access heathcare services."),50,85,500,400);
    textSize(18);
    text(" LGBT+   Lesbians  Gay Men   Bi Men   Bi Women   Trans People",75,450);
    textSize(20);
    int factor = 5;
    text("  0",50,438);
    text("10",50,(438-10*factor));
    text("20",50,(438-20*factor));
    text("30",50,(438-30*factor));
    text("40",50,(438-40*factor));
    text("50",50,(438-50*factor));
    fill(100);
    rect(83,(430-factor*(100-overallavg)),40,(factor*(100-overallavg)));
    rect(155,(430-factor*(100-lesbian)),40,(factor*(100-lesbian)));
    rect(230,(430-factor*(100-gay)),40,(factor*(100-gay)));
    rect(297,(430-factor*(100-mbi)),40,(factor*(100-mbi)));
    rect(375,(430-factor*(100-fbi)),40,(factor*(100-fbi)));
    rect(465,(430-factor*(100-trans)),40,(factor*(100-trans)));
    Checkbox(false);
  }
}

void mouseClicked() {
  if (mouseX >= 40 && mouseX <= 60 && mouseY >= 40 && mouseY <= 60) {
    group = !group;
  }
}

void Checkbox(boolean g) {
  fill(200);
  rect(25,25,550,50,10);
  if (mouseX >= 40 && mouseX <= 60 && mouseY >= 40 && mouseY <= 60) fill(200);
  else fill(240);
  rect(40,40,20,20,5);
  fill(0);
  if (g == false) rect(45,45,10,10,3);
  textSize(20);
  text("Link questions about specific LGBT+ identity",70,58);
}
