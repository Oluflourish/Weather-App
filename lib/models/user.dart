class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String gender;

  // User();

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.gender,
  });

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        email = map['email'],
        phone = map['phone'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
    };
  }
}
