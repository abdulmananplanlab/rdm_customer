part of 'entity.dart';

class UserEntity {
  const UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.isEmailVerified,
    this.phoneNo,
    this.fcmEndpoint,
    this.profileImage,
    this.coverPhoto,
    this.userSignature,
    this.messageNotfications,
    this.activityNotifications,
    this.emailNotifications,
    this.chatStatus,
    this.status,
    this.signUpType,
    this.loginUpType,
    this.qrCodeSecret,
    this.qrCode,
    this.text2fa,
    this.email2fa,
    this.authApp2fa,
    this.createdAt,
    this.updatedAt,
    this.token,
  });
  factory UserEntity.fromJson(
    JsonObject json,
    String? token,
  ) =>
      UserEntity(
        id: $cast(json['id']),
        email: $cast(json['email']),
        isEmailVerified: $cast(json['is_email_verified']),
        phoneNo: $cast(json['phone_no']),
        profileImage: $cast(json['profile_image']),
        coverPhoto: $cast(json['cover_photo']),
        userSignature: $cast(json['user_signature']),
        status: $cast(json['status']),
        signUpType: $cast(json['signUpType']),
        loginUpType: $cast(json['loginType']),
        qrCodeSecret: $cast(json['qr_code_secret']),
        qrCode: $cast(json['qr_code']),
        text2fa: $cast(json['text_2fa']),
        email2fa: $cast(json['email_2fa']),
        authApp2fa: $cast(json['auth_app_2fa']),
        createdAt: $cast(json['createdAt']),
        updatedAt: $cast(json['updatedAt']),
        token: token,
        firstName: $cast(json['first_name']),
        lastName: $cast(json['last_name']),
        fcmEndpoint: $cast(json['fcm_endpoint']),
        messageNotfications: $cast(json['message_notfications']),
        activityNotifications: $cast(json['activity_notifications']),
        emailNotifications: $cast(json['email_notifications']),
        chatStatus: $cast(json['chat_status']),
      );

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? isEmailVerified;
  final String? phoneNo;
  final String? fcmEndpoint;
  final String? profileImage;
  final String? coverPhoto;
  final String? userSignature;
  final String? messageNotfications;
  final String? activityNotifications;
  final String? emailNotifications;
  final String? chatStatus;
  final String? status;
  final String? signUpType;
  final String? loginUpType;
  final String? qrCodeSecret;
  final String? qrCode;
  final bool? text2fa;
  final bool? email2fa;
  final bool? authApp2fa;
  final String? createdAt;
  final String? updatedAt;
  final String? token;

  JsonObject toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'fcm_endpoint': fcmEndpoint,
        'message_notfications': messageNotfications,
        'activity_notifications': activityNotifications,
        'email_notifications': emailNotifications,
        'chat_status': chatStatus,
        'loginType': loginUpType,
        'email': email,
        'is_email_verified': isEmailVerified,
        'phone_no': phoneNo,
        'profile_image': profileImage,
        'cover_photo': coverPhoto,
        'user_signature': userSignature,
        'status': status,
        'signUpType': signUpType,
        'qr_code_secret': qrCodeSecret,
        'qr_code': qrCode,
        'text_2fa': text2fa,
        'email_2fa': email2fa,
        'auth_app_2fa': authApp2fa,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'token': token,
      };
}
