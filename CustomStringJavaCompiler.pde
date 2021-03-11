/**
 * Create by andy on 2018-12-06 21:25
 */
class CustomStringJavaCompiler {
  // 类全名
  String fullClassName;
  String sourceCode;
  // 存放编译之后的字节码(key:类全名,value:编译之后输出的字节码)
  Map<String, ByteJavaFileObject> javaFileObjectMap=new ConcurrentHashMap();
  // 获取java的编译器
  JavaCompiler compiler;
  // 存放编译过程中输出的信息
  DiagnosticCollector<JavaFileObject> diagnosticsCollector=new DiagnosticCollector();
  // 执行结果（控制台输出的内容）
  String runResult;
  // 编译耗时(单位ms)
  long compilerTakeTime;
  // 运行耗时(单位ms)
  long runTakeTime;
  CustomStringJavaCompiler(String sourceCode, String className) {
    this.sourceCode=sourceCode;
    this.fullClassName=className;
  }
  /**
   * 编译字符串源代码,编译失败在 diagnosticsCollector 中获取提示信息
   *
   * @return true:编译成功 false:编译失败
   */
  boolean compile() {
    long startTime=System.currentTimeMillis();
    println(System.getProperty("java.home"));
    println(compiler=ToolProvider.getSystemJavaCompiler());
    // 标准的内容管理器,更换成自己的实现，覆盖部分方法
    StandardJavaFileManager standardFileManager=compiler.getStandardFileManager(diagnosticsCollector, null, null);
    JavaFileManager javaFileManager=new StringJavaFileManage(standardFileManager);
    // 构造源代码对象
    JavaFileObject javaFileObject=new StringJavaFileObject(fullClassName, sourceCode);
    // 获取一个编译任务
    JavaCompiler.CompilationTask task=compiler.getTask(null, javaFileManager, diagnosticsCollector, null, null, Arrays.asList(javaFileObject));
    // 获取编译耗时
    compilerTakeTime=System.currentTimeMillis()-startTime;
    return task.call();
  }
  Class findClass(String name) throws ClassNotFoundException {
    return new HotDeploymentClassLoader().findClass(name);
  }
  /**
   * 执行main方法，重定向System.out.print
   */
  void runMainMethod() throws ClassNotFoundException, NoSuchMethodException, InvocationTargetException, IllegalAccessException, UnsupportedEncodingException {
    PrintStream out=System.out;
    try {
      long startTime=System.currentTimeMillis();
      ByteArrayOutputStream outputStream=new ByteArrayOutputStream();
      PrintStream printStream=new PrintStream(outputStream);
      // PrintStream PrintStream = new PrintStream("/Users/andy/Desktop/tem.sql"); //输出到文件
      System.setOut(printStream); // 测试kill线程暂时屏蔽
      HotDeploymentClassLoader scl=new HotDeploymentClassLoader();
      Class<?> aClass=scl.findClass(fullClassName);
      Method main=aClass.getMethod("main", String[].class);
      Object[] pars=new Object[1];
      pars[0]=new String[] {};
      main.invoke(null, pars); // 调用main方法
      // 设置运行耗时
      runTakeTime=System.currentTimeMillis()-startTime;
      // 设置打印输出的内容
      runResult=new String(outputStream.toByteArray(), "utf-8");
    }
    finally {
      // 还原默认打印的对象
      System.setOut(out);
    }
  }
  /**
   * @return 编译信息(错误 警告)
   */
  String getCompilerMessage() {
    StringBuilder sb=new StringBuilder();
    List<Diagnostic<? extends JavaFileObject>> diagnostics=diagnosticsCollector.getDiagnostics();
    for (Diagnostic<? extends JavaFileObject> diagnostic:diagnostics) {
      sb.append(diagnostic.toString()).append("\r\n");
    }
    return sb.toString();
  }
  /**
   * @return 控制台打印的信息
   */
  String getRunResult() {
    return runResult;
  }
  long getCompilerTakeTime() {
    return compilerTakeTime;
  }
  long getRunTakeTime() {
    return runTakeTime;
  }
  /**
   * 自定义一个字符串的源码对象
   */
  class StringJavaFileObject extends SimpleJavaFileObject {
    // 等待编译的源码字段
    String contents;
    // java源代码 => StringJavaFileObject对象 的时候使用
    StringJavaFileObject(String className, String contents) {
      super(URI.create("string:///"+className.replaceAll("\\.", "/")+Kind.SOURCE.extension), Kind.SOURCE);
      this.contents=contents;
    }
    // 字符串源码会调用该方法
    @Override
      CharSequence getCharContent(boolean ignoreEncodingErrors) throws IOException {
      return contents;
    }
  }
  /**
   * 自定义一个编译之后的字节码对象
   */
  class ByteJavaFileObject extends SimpleJavaFileObject {
    // 存放编译后的字节码
    ByteArrayOutputStream outPutStream;
    ByteJavaFileObject(String className, Kind kind) {
      super(URI.create("string:///"+className.replaceAll("\\.", "/")+Kind.SOURCE.extension), kind);
    }
    // StringJavaFileManage 编译之后的字节码输出会调用该方法（把字节码输出到outputStream）
    @Override
      OutputStream openOutputStream() {
      outPutStream=new ByteArrayOutputStream();
      return outPutStream;
    }
    // 在类加载器加载的时候需要用到
    byte[] getCompiledBytes() {
      return outPutStream.toByteArray();
    }
  }
  /**
   * 自定义一个JavaFileManage来控制编译之后字节码的输出位置
   */
  class StringJavaFileManage extends ForwardingJavaFileManager {
    StringJavaFileManage(JavaFileManager fileManager) {
      super(fileManager);
    }
    // 获取输出的文件对象，它表示给定位置处指定类型的指定类。
    @Override
      JavaFileObject getJavaFileForOutput(Location location, String className, JavaFileObject.Kind kind, FileObject sibling) throws IOException {
      ByteJavaFileObject javaFileObject=new ByteJavaFileObject(className, kind);
      javaFileObjectMap.put(className, javaFileObject);
      return javaFileObject;
    }
  }
  /**
   * 自定义类加载器, 用来加载动态的字节码
   */
  class HotDeploymentClassLoader extends ClassLoader {
    @Override
      protected Class<?> findClass(String name) throws ClassNotFoundException {
      ByteJavaFileObject fileObject=javaFileObjectMap.get(name);
      if (fileObject!=null) {
        byte[] bytes=fileObject.getCompiledBytes();
        return defineClass(name, bytes, 0, bytes.length);
      }
      try {
        return ClassLoader.getSystemClassLoader().loadClass(name);
      }
      catch(Exception e) {
        return super.findClass(name);
      }
    }
  }
}
