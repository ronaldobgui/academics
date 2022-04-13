class Academic {
  late final String id;
  late final String name;
  late final int age;

  Academic(this.name, this.age);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
    };
  }

  Academic.fromMap(Map<String, dynamic> academicMap)
      : name = academicMap['name'],
        age = academicMap['age'];
}
