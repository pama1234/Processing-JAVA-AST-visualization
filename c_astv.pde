public class ASTVisitPut extends ASTVisitor {
  private void put(ASTNode in) {
    String methodName=Thread.currentThread().getStackTrace()[2].getMethodName();
    if (!methodName.equals("visit"))
      return;
    print(">- ");
    StringBuilder sb=new StringBuilder(methodName);
    while (sb.length()<12) {
      sb.append(' ');
    }
    print(sb.toString());
    sb.setLength(0);
    sb.append(String.valueOf(in.getNodeType()));
    while (sb.length()<4) {
      sb.append(' ');
    }
    print(sb.toString());
    sb.setLength(0);
    sb.append(in.getClass().getName());
    while (sb.length()<46) {
      sb.append(' ');
    }
    sb.append(" {");
    sb.append(in.toString().replace("\n", "<·>"));
    sb.append('}');
    println(sb.toString());
    DisplayData dd=new DisplayData(width/2, height/2, in);
    map.put(in, dd);
    drawList.add(dd);
  }
  @Override
    public void preVisit(ASTNode node) {
    put(node);
    super.preVisit(node);
  }
  @Override
    public boolean preVisit2(ASTNode node) {
    put(node);
    return super.preVisit2(node);
  }
  @Override
    public void postVisit(ASTNode node) {
    put(node);
    super.postVisit(node);
  }
  @Override
    public boolean visit(AnnotationTypeDeclaration node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(AnnotationTypeMemberDeclaration node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(AnonymousClassDeclaration node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ArrayAccess node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ArrayCreation node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ArrayInitializer node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ArrayType node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(AssertStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(Assignment node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(Block node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(BlockComment node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(BooleanLiteral node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(BreakStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(CastExpression node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(CatchClause node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(CharacterLiteral node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ClassInstanceCreation node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(CompilationUnit node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ConditionalExpression node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ConstructorInvocation node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ContinueStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(CreationReference node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(Dimension node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(DoStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(EmptyStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(EnhancedForStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(EnumConstantDeclaration node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(EnumDeclaration node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ExpressionMethodReference node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ExpressionStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(FieldAccess node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(FieldDeclaration node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ForStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(IfStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ImportDeclaration node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(InfixExpression node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(Initializer node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(InstanceofExpression node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(IntersectionType node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(Javadoc node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(LabeledStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(LambdaExpression node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(LineComment node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(MarkerAnnotation node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(MemberRef node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(MemberValuePair node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(MethodRef node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(MethodRefParameter node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(MethodDeclaration node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(MethodInvocation node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(Modifier node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(NameQualifiedType node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(NormalAnnotation node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(NullLiteral node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(NumberLiteral node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(PackageDeclaration node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ParameterizedType node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ParenthesizedExpression node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(PostfixExpression node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(PrefixExpression node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(PrimitiveType node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(QualifiedName node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(QualifiedType node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ReturnStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(SimpleName node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(SimpleType node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(SingleMemberAnnotation node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(SingleVariableDeclaration node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(StringLiteral node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(SuperConstructorInvocation node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(SuperFieldAccess node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(SuperMethodInvocation node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(SuperMethodReference node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(SwitchCase node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(SwitchStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(SynchronizedStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(TagElement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(TextElement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ThisExpression node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(ThrowStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(TryStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(TypeDeclaration node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(TypeDeclarationStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(TypeLiteral node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(TypeMethodReference node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(TypeParameter node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(UnionType node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(VariableDeclarationExpression node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(VariableDeclarationStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(VariableDeclarationFragment node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(WhileStatement node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public boolean visit(WildcardType node) {
    put(node);
    return super.visit(node);
  }
  @Override
    public void endVisit(AnnotationTypeDeclaration node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(AnnotationTypeMemberDeclaration node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(AnonymousClassDeclaration node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ArrayAccess node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ArrayCreation node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ArrayInitializer node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ArrayType node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(AssertStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(Assignment node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(Block node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(BlockComment node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(BooleanLiteral node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(BreakStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(CastExpression node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(CatchClause node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(CharacterLiteral node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ClassInstanceCreation node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(CompilationUnit node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ConditionalExpression node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ConstructorInvocation node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ContinueStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(CreationReference node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(DoStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(EmptyStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(EnhancedForStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(EnumConstantDeclaration node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(EnumDeclaration node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ExpressionMethodReference node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ExpressionStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(Dimension node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(FieldAccess node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(FieldDeclaration node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ForStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(IfStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ImportDeclaration node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(InfixExpression node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(InstanceofExpression node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(Initializer node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(Javadoc node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(LabeledStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(LambdaExpression node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(LineComment node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(MarkerAnnotation node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(MemberRef node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(MemberValuePair node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(MethodRef node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(MethodRefParameter node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(MethodDeclaration node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(MethodInvocation node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(Modifier node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(NameQualifiedType node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(NormalAnnotation node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(NullLiteral node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(NumberLiteral node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(PackageDeclaration node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ParameterizedType node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ParenthesizedExpression node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(PostfixExpression node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(PrefixExpression node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(PrimitiveType node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(QualifiedName node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(QualifiedType node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ReturnStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(SimpleName node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(SimpleType node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(SingleMemberAnnotation node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(SingleVariableDeclaration node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(StringLiteral node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(SuperConstructorInvocation node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(SuperFieldAccess node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(SuperMethodInvocation node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(SuperMethodReference node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(SwitchCase node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(SwitchStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(SynchronizedStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(TagElement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(TextElement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ThisExpression node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(ThrowStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(TryStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(TypeDeclaration node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(TypeDeclarationStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(TypeLiteral node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(TypeMethodReference node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(TypeParameter node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(UnionType node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(IntersectionType node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(VariableDeclarationExpression node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(VariableDeclarationStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(VariableDeclarationFragment node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(WhileStatement node) {
    put(node);
    super.endVisit(node);
  }
  @Override
    public void endVisit(WildcardType node) {
    put(node);
    super.endVisit(node);
  }
}
