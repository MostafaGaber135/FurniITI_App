import 'dart:convert';


class UserModel {
  final String id;
  final String email;
  final String? password;
  final String role;
  final String? image;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? token;
  final String? refreshToken;
  final Name userName;
  final List<String> wishlist;
  final List<String> ispurchased;
  final String? phone;

  UserModel({
    required this.id,
    required this.email,
    this.password,
    required this.role,
    this.image,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    this.token,
    this.refreshToken,
    required this.userName,
    this.wishlist = const [],
    this.ispurchased = const [],
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      email: json['email'] ?? '',
      password: json['password'],
      role: json['role'] ?? '',
      image: json['image'],
      isVerified: json['isVerified'] ?? false,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
      token: json['token'],
      refreshToken: json['refreshToken'],
      userName: Name.fromJson(json['userName'] ?? {}),
      wishlist: List<String>.from(json['wishlist'] ?? []),
      ispurchased: List<String>.from(json['ispurchased'] ?? []),
      phone: json['phone'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'password': password,
      'role': role,
      'image': image,
      'isVerified': isVerified,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'token': token,
      'refreshToken': refreshToken,
      'userName': userName.toJson(),
      'wishlist': wishlist,
      'ispurchased': ispurchased,
      'phone': phone,
    };
  }

  UserModel copyWith({
    String? token,
    String? refreshToken,
    List<String>? wishlist,
    List<String>? ispurchased,
    String? phone,
  }) {
    return UserModel(
      id: id,
      email: email,
      password: password,
      role: role,
      image: image,
      isVerified: isVerified,
      createdAt: createdAt,
      updatedAt: updatedAt,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      userName: userName,
      wishlist: wishlist ?? this.wishlist,
      ispurchased: ispurchased ?? this.ispurchased,
      phone: phone ?? this.phone,
    );
  }

  String get nameEn => userName.en;
  String get nameAr => userName.ar;
}

class Name {
  final String en;
  final String ar;

  Name({required this.en, required this.ar});

  factory Name.fromJson(dynamic json) {
    if (json is String) {
      try {
        json = jsonDecode(json);
      } catch (_) {
        json = {};
      }
    }

    return Name(en: json['en'] ?? '', ar: json['ar'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'en': en, 'ar': ar};
  }
}

class Address {
  final String en;
  final String ar;

  Address({required this.en, required this.ar});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(en: json['en'] ?? '', ar: json['ar'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'en': en, 'ar': ar};
  }
}
