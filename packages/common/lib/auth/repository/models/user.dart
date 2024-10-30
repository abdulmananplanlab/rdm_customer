part of 'models.dart';

class User extends Equatable {
  const User({
    this.id = '',
    this.email,
    this.isEmailVerified,
    this.phoneNo,
    this.profileImage,
    this.coverPhoto,
    this.userSignature,
    this.firstName,
    this.lastName,
    this.fcmEndpoint,
    this.messageNotfications,
    this.activityNotifications,
    this.emailNotifications,
    this.chatStatus,
    this.loginUpType,
    this.status,
    this.signUpType,
    this.qrCodeSecret,
    this.qrCode,
    this.text2fa,
    this.email2fa,
    this.authApp2fa,
    this.createdAt,
    this.updatedAt,
    this.token = '',
  });

  factory User.fromEntity(UserEntity entity) {
    return User(
      id: entity.id ?? '',
      firstName: entity.firstName,
      activityNotifications: entity.activityNotifications,
      chatStatus: entity.chatStatus,
      emailNotifications: entity.emailNotifications,
      fcmEndpoint: entity.fcmEndpoint,
      lastName: entity.lastName,
      loginUpType: entity.loginUpType,
      messageNotfications: entity.messageNotfications,
      email: entity.email,
      isEmailVerified: entity.isEmailVerified,
      phoneNo: entity.phoneNo,
      profileImage: entity.profileImage,
      coverPhoto: entity.coverPhoto,
      userSignature: entity.userSignature,
      status: entity.status,
      signUpType: entity.signUpType,
      qrCodeSecret: entity.qrCodeSecret,
      qrCode: entity.qrCode,
      text2fa: entity.text2fa,
      email2fa: entity.email2fa,
      authApp2fa: entity.authApp2fa,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      token: entity.token ?? '',
    );
  }

  factory User.fromJson(JsonObject json) => User.fromEntity(
        UserEntity.fromJson(
          json,
          $cast(json['token']),
        ),
      );

  final String id;
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
  final String token;

  static const empty = User();
  static const loading = User(email: 'loading');

  UserEntity toEntity() => UserEntity(
        messageNotfications: messageNotfications,
        loginUpType: loginUpType,
        lastName: lastName,
        fcmEndpoint: fcmEndpoint,
        emailNotifications: emailNotifications,
        chatStatus: chatStatus,
        activityNotifications: activityNotifications,
        firstName: firstName,
        id: id,
        email: email,
        isEmailVerified: isEmailVerified,
        phoneNo: phoneNo,
        profileImage: profileImage,
        coverPhoto: coverPhoto,
        userSignature: userSignature,
        status: status,
        signUpType: signUpType,
        qrCodeSecret: qrCodeSecret,
        qrCode: qrCode,
        text2fa: text2fa,
        email2fa: email2fa,
        authApp2fa: authApp2fa,
        createdAt: createdAt,
        updatedAt: updatedAt,
        token: token,
      );

  JsonObject toJson() => toEntity().toJson();

  @override
  List<Object?> get props => [
        id,
        email,
        isEmailVerified,
        phoneNo,
        profileImage,
        coverPhoto,
        userSignature,
        status,
        signUpType,
        qrCodeSecret,
        qrCode,
        text2fa,
        email2fa,
        authApp2fa,
        createdAt,
        updatedAt,
        token,
        messageNotfications,
        loginUpType,
        lastName,
        fcmEndpoint,
        emailNotifications,
        chatStatus,
        activityNotifications,
        firstName,
      ];

  bool get isEmpty => id.isEmpty;

  bool get isNotEmpty => !isEmpty;

  bool get isAuthenticated => isNotEmpty && token.isNotEmpty;

  bool get isNotAuthenticated => !isAuthenticated;

  bool get isLoading => this == loading;

  bool get isProfileCompleted =>
      profileImage?.notBlank != null && coverPhoto?.notBlank != null;

  bool get isUserAgreementComplete => userSignature?.notBlank != null;

  bool get isTwoFactorPhoneComplete => phoneNo?.notBlank != null;
  bool get isTwoFactorAuthenticatorComplete =>
      qrCode?.notBlank != null && qrCodeSecret?.notBlank != null;

  // String get firstName => name?.split(' ').firstOrNull?.capitalize() ?? '';
}
