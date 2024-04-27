class User {
  final String imageUrl;
  final String gender;
  final String firstName;
  final String lastName;
  final String email;

  User({required this.imageUrl,required this.email,required this.gender,required this.firstName,required this.lastName});

  factory User.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    return User(
      gender:json['gender'] ,
      imageUrl: json['picture']['large'],
      firstName: name['first'],
      lastName: name['last'],
      email: json['email'], 
      
    );
  }

}
