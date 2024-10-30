class SlackApiEndpoints {
  SlackApiEndpoints._(); // coverage:ignore-line

  static const login = 'customer/login';
  static const signUp = 'customer/signup';
  static const phoneNumberOtp = 'pinpoint/send-otp';
  static const phoneNumberOtpVerified = 'pinpoint/validate';
  static const authenticatorQrImageGenerate = 'two-factor-auth/qr/generate';
  static const authenticatorQrSecretGenerate = 'two-factor-auth/qr/secret';
  static const authVerify = 'two-factor-auth/qr/verify';
  static const userFileUpload = 'user-file/upload';
  static const additionalDocumentUpload = 'additional-doc/upload';
  static const additionalDocumentDelete = 'additional-doc/';
  static const userFileDelete = 'user-file';
  static const userFileFetch = 'user-file/user-files/file-type';
  static const additionalFileFetch = 'additional-doc/user-files';
  static const builderUserUpdate = 'builder-user/update';
  static const verificationCodeGenerate = 'verification/generate-megic-link';
}
