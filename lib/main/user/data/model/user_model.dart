class UserModel {
  final String uid;
  final String displayName;
  final String email;
  final String? photoURL;
  final DateTime? creationTime;
  final String? password;

  const UserModel({
    required this.uid,
    required this.displayName,
    required this.email,
    this.photoURL,
    this.creationTime,
    this.password,
  });

  /// ✅ Factory tạo model cho login
  factory UserModel.login({required String email, required String password}) {
    return UserModel(
      uid: '', // chưa có uid vì chưa login
      displayName: '',
      email: email,
      password: password,
    );
  }

  /// ✅ Factory tạo model cho create/register
  factory UserModel.create({
    required String displayName,
    required String email,
    required String password,
    String? photoURL,
  }) {
    return UserModel(
      uid: '',
      displayName: displayName,
      email: email,
      password: password,
      photoURL: photoURL,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      photoURL: json['photoURL'] as String?,
      creationTime: json['creationTime'] != null
          ? DateTime.tryParse(json['creationTime'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'photoURL': photoURL,
      'creationTime': creationTime?.toIso8601String(),
    };
  }

  Map<String, dynamic> toCreate() {
    return {
      'username': email,
      'password': password,
      'displayName': displayName,
      if (photoURL != null) 'photoURL': photoURL,
    };
  }

  Map<String, dynamic> toLogin() {
    return {
      'username': email,
      'password': password,
    };
  }

  Map<String, dynamic> toReq() {
    return {
      if (displayName.isNotEmpty) 'displayName': displayName,
      if (photoURL != null) 'photoURL': photoURL,
    };
  }

  Map<String, dynamic> toResponse() {
    return {
      'id': uid,
      'name': displayName,
      'email': email,
      'avatar': photoURL,
    };
  }

  UserModel toUpdateModel({
    String? displayName,
    String? email,
    String? photoURL,
  }) {
    return UserModel(
      uid: uid,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
      creationTime: creationTime,
      password: password,
    );
  }

  bool isEqual(UserModel other) {
    return uid == other.uid &&
        displayName == other.displayName &&
        email == other.email &&
        photoURL == other.photoURL &&
        creationTime == other.creationTime;
  }

  UserModel clone() {
    return UserModel(
      uid: uid,
      displayName: displayName,
      email: email,
      photoURL: photoURL,
      creationTime: creationTime,
      password: password,
    );
  }
}
