AST ast;
CompilationUnit cu;
HashMap<ASTNode, DisplayData> map;
float spaceLength;
LinkedList<DisplayData> drawList;
DisplayData c;
class DisplayData {
  float x, y;
  float velX, velY;
  ASTNode node;
  ArrayList<DisplayData> sonList;
  DisplayData parent;
  String s, n;
  float tw, th;
  float nw;
  DisplayData(float x, float y, ASTNode in) {
    node=in;
    refresh();
    this.x=x-tw/2;
    this.y=y-th/2;
    velX=random(-width/24f, width/24f);
    velY=random(-height/24f, height/24f);
    sonList=new ArrayList<DisplayData>();
  }
  //void ini() {
  //}
  void toParent() {
    ASTNode p=node.getParent();
    if (p!=null)
      (parent=map.get(p)).addSon(this);
  }
  void addSon(DisplayData in) {
    sonList.add(in);
  }
  void display() {
    for (DisplayData i : sonList) {
      line(x, y, i.x, i.y);
    }
    fill(0);
    rect(x, y, w(), h());
    fill(255);
    text(s, x+spaceLength, y);
    fill(246, 97, 46);
    //text(n, x-nw-spaceLength, y);
    text(n, x, y-g.textSize*1.5);
  }
  void update() {
    velX*=0.9;
    velY*=0.9;
    x+=velX;
    y+=velY;
  }
  float posUpdate(float x, float y) {
    this.x=x;
    this.y=y;
    float count=y;
    float xpos=0;
    for (DisplayData i : sonList) {
      if (count>height) {
        count=0;
        xpos+=width/4;
        count=i.posUpdate(x+xpos+16, h()+g.textSize*0.5);
      } else {
        count=i.posUpdate(x+xpos+16, h()+g.textSize*0.5);
      }
    }
    return count;
  }
  //void posUpdate() {
  //  if (parent!=null&&sonList.size()>0) {
  //    float sumX=0, sumY=0;
  //    for (DisplayData i : sonList) {
  //      sumX+=i.x;
  //      sumY+=i.y;
  //    }
  //    sumX/=sonList.size();
  //    sumY/=sonList.size();
  //    x=(sumX+parent.x)/2;
  //    x=(sumY+parent.y)/2;
  //  }
  //}
  void refresh() {
    s=node.toString();
    n=node.getClass().getSimpleName();
    nw=textWidth(n);
    tw=textWidth(s);
    th=(s.length()-s.replaceAll("\n", "").length())+2;
  }
  int w() {
    return int(tw+spaceLength*2);
  }
  int h() {
    return int(g.textSize*(th+0.25));
  }
}
void settings() {
  //size(640, 640);
  fullScreen();
}
void mousePressed() {
  c=select(mouseX, mouseY);
}
void keyPressed() {
  switch(key) {
  case 'e':
    //for (DisplayData i : drawList) {
    //  i.posUpdate();
    //}
    map.get(cu).posUpdate(mouseX, mouseY);
    break;
  }
}
void setup() {
  astp();
  map=new HashMap<ASTNode, DisplayData>();
  drawList=new LinkedList<DisplayData>();
  cu.accept(new ASTVisitPut());
  //map.forEach(
  //  new BiConsumer<ASTNode, DisplayData>() {
  //  @Override
  //    public void accept(ASTNode k, DisplayData v) {
  //    println(k.toString().replace("\n", "<·>"), v.x, v.y);
  //  }
  //}  
  //);
  for (DisplayData i : drawList) {
    i.toParent();
  }
  println(map.size());
  textAlign(LEFT, TOP);
  textSize(16);
  stroke(255);
}
@Override
  void textSize(float in) {
  super.textSize(in);
  textLeading(g.textSize*1.1);
  spaceLength=textWidth(' ');
  for (DisplayData i : drawList) {
    i.refresh();
  }
}
void draw() {
  background(0);
  for (DisplayData i : drawList) {
    i.update();
  }
  for (DisplayData i : drawList) {
    i.display();
  }
  if (c!=null) {
    noFill();
    rect(c.x-16, c.y-16, c.w()+32, c.h()+32);
  }
  //finished=true;
}
DisplayData select(int x, int y) {
  for (int n=drawList.size()-1; n>=0; n--) {
    DisplayData i=drawList.get(n);
    if ((x>i.x)&&(y>i.y)&&x<(i.x+i.w())&&y<(i.y+i.h())) {
      return i;
    }
  }
  return null;
}
void mouseDragged() {
  if (c!=null) {
    c.x+=mouseX-pmouseX;
    c.y+=mouseY-pmouseY;
  }
}
