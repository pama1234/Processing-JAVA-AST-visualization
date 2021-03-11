void astp() {
  ASTParser astp=ASTParser.newParser(AST.JLS10);
  String sorce="package innerWorld.main;"
    +"public class MainClass{"
    +"  public static float[] function(float[] input) {"
    +"    float[] output=new float[input.length];"
    +"    return output;"
    +"  }"
    +"}";
  float score=Float.MAX_VALUE;
  astp.setSource(sorce.toCharArray());
  cu=(CompilationUnit)astp.createAST(null);
  ast=cu.getAST();
  List nl=(List)cu.getStructuralProperty(CompilationUnit.TYPES_PROPERTY);
  TypeDeclaration td=((TypeDeclaration)nl.get(0));
  MethodDeclaration md=td.getMethods()[0];
  Block bk=md.getBody();
  List sl=(List)bk.getStructuralProperty(Block.STATEMENTS_PROPERTY);
  for (int j=0; j<5; j++) {
    Assignment at=ast.newAssignment();
    at.setOperator(Assignment.Operator.ASSIGN);
    ArrayAccess aa=ast.newArrayAccess();
    aa.setArray(ast.newSimpleName("output"));
    aa.setIndex(ast.newNumberLiteral(Integer.toString(j)));
    at.setLeftHandSide(aa);
    at.setRightHandSide(iterate(2, ast));
    sl.add(1, ast.newExpressionStatement(at));
  }
  IProblem[] ip=cu.getProblems();
  println(Arrays.toString(ip));
  println(cu);
  CustomStringJavaCompiler csjc=new CustomStringJavaCompiler(cu.toString(), "innerWorld.main.MainClass");
  println(csjc.compile()?"<good>":"<oh no>");
  Class cs=null;
  try {
    cs=csjc.findClass("innerWorld.main.MainClass");
  }  
  catch(ClassNotFoundException e) {
    e.printStackTrace();
  }
  catch(IllegalArgumentException e) {
    e.printStackTrace();
  }
  Method[] mda=cs.getMethods();
  //      for(int j=-5;j<5;j++) {
  //      int j=-5;
  //      float[] input=new float[] {j,j+1,j+2,j+3,j+4};
  float[] input=new float[] {-2351, -345, 0, 125, 1646};
  float[] f;
  try {
    f=(float[])mda[0].invoke(null, new Object[] {input});
  }
  catch(Throwable t) {
    println(t.toString());
    f=new float[] {Float.NaN, Float.NaN, Float.NaN, Float.NaN, Float.NaN};
  }
  float[] o=objective(input);
  String s=Arrays.toString(input);
  score=score(f, o);
  println(s+" score(f,o)="+score+" objective(in)="+Arrays.toString(o)+" f(in)="+Arrays.toString(f));
}
