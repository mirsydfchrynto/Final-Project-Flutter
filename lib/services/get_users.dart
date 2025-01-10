class GetUsers {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;

  GetUsers(
      {required this.id,
        required this.email,
        required this.firstname,
        required this.lastname,
        required this.avatar});

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(
        id: json['id'],
        email: json['email'],
        firstname: json['first_name'],
        lastname: json['last_name '],
        avatar: json['avatar']);
  }
}
