import 'package:diiket/data/models/driver_detaill.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    int? id,
    String? firebase_uid,
    String? name,
    String? email,
    String? address,
    String? phone_number,
    String? type,
    String? profile_picture,
    String? profile_picture_url,
    DriverDetaill? driver_detail,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
