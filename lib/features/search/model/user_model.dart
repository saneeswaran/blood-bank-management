import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    String? image,
    required String name,
    required String email,
    required String? fcmToken,
    required Map<String, dynamic> locationData,
    @Default(0) int? donationCount,
    @Default(false) bool? isDonor,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
