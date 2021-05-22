import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    int? id,
    String? name,
    String? email,
    String? address,
    String? phone_number,
    String? type,
    String? profile_picture,
    String? profile_picture_url,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
