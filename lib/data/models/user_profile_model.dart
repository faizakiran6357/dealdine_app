import '../../domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  UserProfileModel({
    required String fullName,
    required String email,
    required String phone,
    required String bio,
    required String avatarPath,
  }) : super(
          fullName: fullName,
          email: email,
          phone: phone,
          bio: bio,
          avatarPath: avatarPath,
        );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phone'],
      bio: json['bio'],
      avatarPath: json['avatarPath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'bio': bio,
      'avatarPath': avatarPath,
    };
  }
}
