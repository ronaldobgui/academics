class Owner {
  late String name;
  late String email;
  late String phone;
  late String? id;

  Owner(this.name, this.email, this.phone, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  Owner.fromMap(Map<String, dynamic> ownerMap)
      : name = ownerMap['name'],
        email = ownerMap['email'],
        phone = ownerMap['phone'];
}
