static float score(float[] a, float[] b) {
  float sum=0;
  for (int i=0; i<a.length; i++) {
    if (a[i]==b[i])
      continue;
    if ((!Float.isFinite(a[i]))||(!Float.isFinite(b[i]))) {
      sum+=Float.POSITIVE_INFINITY;
      continue;
    }
    float def=Math.abs(a[i]-b[i]);
    println(i+" "+def);
    sum+=def;
  }
  return sum;
}
public static float[] objective(float[] input) {
  float[] output=new float[input.length];
  output[4]=input[0];
  output[3]=input[3]/25134132;
  output[2]=input[2]*input[2];
  output[1]=input[1];
  output[0]=0;
  return output;
}
Random rng=new Random();
public Expression iterate(int life, AST ast) {
  if (life<=0)
    if (rng.nextBoolean())
      return ast.newNumberLiteral(Integer.toString(rng.nextInt()));
    else {
      //        return ast.newSimpleName("input");
      ArrayAccess aa=ast.newArrayAccess();
      aa.setArray(ast.newSimpleName("input"));
      aa.setIndex(ast.newNumberLiteral(Integer.toString(rng.nextInt(5))));
      return aa;
    }
  int rn=rng.nextInt(7);
  switch(rn) {
  case 0:
    return ast.newNumberLiteral(Integer.toString(rng.nextInt()));
  case 1: 
    {
      InfixExpression ie=ast.newInfixExpression();
      ie.setLeftOperand(iterate(life-1, ast));
      ie.setOperator(InfixExpression.Operator.PLUS);
      ie.setRightOperand(iterate(life-1, ast));
      ParenthesizedExpression pe=ast.newParenthesizedExpression();
      pe.setExpression(ie);
      return pe;
    }
  case 2: 
    {
      InfixExpression ie=ast.newInfixExpression();
      ie.setLeftOperand(iterate(life-1, ast));
      ie.setOperator(InfixExpression.Operator.MINUS);
      ie.setRightOperand(iterate(life-1, ast));
      ParenthesizedExpression pe=ast.newParenthesizedExpression();
      pe.setExpression(ie);
      return pe;
    }
  case 3: 
    {
      InfixExpression ie=ast.newInfixExpression();
      ie.setLeftOperand(iterate(life-1, ast));
      ie.setOperator(InfixExpression.Operator.TIMES);
      ie.setRightOperand(iterate(life-1, ast));
      ParenthesizedExpression pe=ast.newParenthesizedExpression();
      pe.setExpression(ie);
      return pe;
    }
  case 4: 
    {
      InfixExpression ie=ast.newInfixExpression();
      ie.setLeftOperand(iterate(life-1, ast));
      ie.setOperator(InfixExpression.Operator.DIVIDE);
      ie.setRightOperand(iterate(life-1, ast));
      ParenthesizedExpression pe=ast.newParenthesizedExpression();
      pe.setExpression(ie);
      return pe;
    }
  case 5: 
    {
      InfixExpression ie=ast.newInfixExpression();
      ie.setLeftOperand(iterate(life-1, ast));
      ie.setOperator(InfixExpression.Operator.REMAINDER);
      ie.setRightOperand(iterate(life-1, ast));
      ParenthesizedExpression pe=ast.newParenthesizedExpression();
      pe.setExpression(ie);
      return pe;
    }
  case 6: 
    {
      //        return ast.newSimpleName("input");
      ArrayAccess aa=ast.newArrayAccess();
      aa.setArray(ast.newSimpleName("input"));
      aa.setIndex(ast.newNumberLiteral(Integer.toString(rng.nextInt(5))));
      return aa;
    }
  default:
    println("err "+rn);
    return null;
  }
}
