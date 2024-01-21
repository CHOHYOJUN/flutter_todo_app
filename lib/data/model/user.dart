class User {
  final String name;
  final int age;
  final String email;

//<editor-fold desc="Data Methods">
  const User({
    required this.name,
    required this.age,
    required this.email,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age &&
          email == other.email);

  @override
  int get hashCode => name.hashCode ^ age.hashCode ^ email.hashCode;

  @override
  String toString() {
    return 'User{' + ' name: $name,' + ' age: $age,' + ' email: $email,' + '}';
  }

  User copyWith({
    String? name,
    int? age,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'age': this.age,
      'email': this.email,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as int,
      email: map['email'] as String,
    );
  }

//</editor-fold>
}
