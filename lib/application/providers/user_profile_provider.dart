import 'package:flutter/material.dart';
import '../../domain/entities/user_profile.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfile _user = UserProfile(
    fullName: "M.Faisal",
    email: "hello@halallab.co",
    phone: "408-841-0926",
    bio: "I love fast food",
    avatarPath: "assets/profile.png",
  );

  UserProfile get user => _user;

  void updateProfile({
    String? fullName,
    String? email,
    String? phone,
    String? bio,
    String? avatarPath,
  }) {
    _user = _user.copyWith(
      fullName: fullName,
      email: email,
      phone: phone,
      bio: bio,
      avatarPath: avatarPath,
    );
    notifyListeners();
  }
}
