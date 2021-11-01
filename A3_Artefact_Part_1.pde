float g;
int i;
String s, quote;
int[] angles = {15,345};
color ButtonColour, HoverColour, PressedColour, tw1, tw2, tw3;
boolean overButton;

void setup() {
  size(600, 500,P2D);
  smooth();
  surface.setResizable(true);
  frameRate(30);
  ButtonColour = color(100);
  HoverColour = color(70);
  PressedColour = color(30);
  g = 4.2192;
  overButton = false;
  tw1 = color(214,29,0);
}

void draw() {
  Percentage();
  background(204);
  if (overButton(25,25,195,75) == true && mousePressed == true) {
    fill(PressedColour);
  } else if (overButton(25,25,195,75) == true) {
    fill(HoverColour);
  } else {
    fill(ButtonColour);
  }
  rect(25, 25, 170, 50, 10);
  fill(200);
  textSize(30);
  text("New Survey",38,60);
  fill(0);
  text(s+"% of cis men are gay", 210, 60);
  chart(160,angles,105,180);
  fill(240);
  rect(210,100,365,375,10);
  fill(tw1);
  ellipse(255,142.5,40,40);
  fill(tw2);
  ellipse(255,260,40,40);
  fill(tw3);
  ellipse(255,380,40,40);
  fill(0);
  textSize(25);
  text("@CBANews",285,150);
  textSize(20);
  String tweet1 = "New study finds that "+i+"% of men in NSW are homosexual.";
  text(tweet1,235,170,320,200);
  if (g<=7) {
    textSize(25);
    text("@BobShepherd",285,267.5);
    text("@PaulaHarrison",285,387.5);
    textSize(20);
    String tweet2 = "we're really spending this much time and money on "+i+"% the population...";
    text(tweet2,235,290,320,200);
    String tweet3 = "surely we have bigger issues to deal with than "+i+"% of people's feelings";
    text(tweet3,235,410,320,200);
    tw2 = color(153,198,232);
    tw3 = color(110,31,19);
  } else if (g<=19) {
    textSize(25);
    text("@JamieCurtis",285,267.5);
    text("@EllieSherman",285,387.5);
    textSize(20);
    String tweet2 = "is anyone else tired of "+i+"% the population refusing to just get in line?";
    text(tweet2,235,290,320,200);
    String tweet3 = i+"%... not in my neighborhood thats for sure lol";
    text(tweet3,235,410,320,200);
    tw3 = color(240,139,67);
    tw2 = color(7,94,45);
  } else {
    textSize(25);
    text("@BenSharper",285,267.5);
    text("@AlexandriaP",285,387.5);
    textSize(20);
    String tweet2 = i+"%... Are we 100% sure there aren't any biases in this study?";
    text(tweet2,235,290,320,200);
    String tweet3 = "I swear more and more people are every year... "+i+"%?? Really??";
    text(tweet3,235,410,320,200);
    tw2 = color(227,213,84);
    tw3 = color(7,29,94);
  }
  gradient(230,310,565,470);
}

void Percentage() {
  s = str(g);
  s = s.substring(0, 4);
  i = int(s);
  quote = str(i);
  angles[0] = round(3.6*g);
  angles[1] = round(360-3.6*g);
}

void chart(float diameter, int[] data,int cx, int cy) {
  fill(100);
  ellipse(cx,cy,diameter+2,diameter+2);
  fill(204);
  arc(cx, cy, diameter, diameter, 0, radians(data[0]));
}

void gradient(int x, int y, int dx, int dy) {
  noStroke();
  beginShape(QUADS);
  fill(240,0);
  vertex(x,y);
  vertex(dx,y);
  fill(240,255);
  vertex(dx,dy);
  vertex(x,dy);
  endShape();
}

boolean overButton(int bx, int by, int bbx, int bby) {
  if (mouseX >= bx && mouseX <= bbx && mouseY >= by && mouseY <= bby) {
    return true;
  }
  else {
    return false;
  }
}

void mouseClicked() {
  if (overButton(25,25,195,75) == true) {
      g = random(35);
  }
}
