class UserProfile {
  final String fullName;
  final String email;
  final String phone;
  final String bio;
  final String avatarPath;

  UserProfile({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.bio,
    required this.avatarPath,
  });

  UserProfile copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? bio,
    String? avatarPath,
  }) {
    return UserProfile(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      bio: bio ?? this.bio,
      avatarPath: avatarPath ?? this.avatarPath,
    );
  }
}
