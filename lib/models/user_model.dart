class UserModel {
  final String uId;
  final String userName;
  final String email;
  final String imageUrl;
  final String type;

  UserModel({
    required this.uId,
    required this.userName,
    required this.email,
    required this.imageUrl,
    required this.type,
  });

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      uId: map['uid'],
      userName: map['userName'],
      email: map['email'],
      imageUrl: map['imageUrl'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uId,
      'userName': userName,
      'email': email,
      'imageUrl': imageUrl,
      'type': type,
    };
  }
}
