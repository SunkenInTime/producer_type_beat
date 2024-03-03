class Sample {
  final String name;
  final int length;
  final String path;
  Sample(this.path, {required this.name, required this.length});

  @override
  String toString() {
    String message = "Name: $name Length: $length Path: $path\n";
    return message;
  }
}
