class ApiEndpoints {
  ApiEndpoints._(); // coverage:ignore-line

  static const login = 'customer/login';
  static const signUp = 'customer/signup';
  static const googleLogin = 'mobile/google-login';
  static const googleSignUp = 'mobile/google-signup';
  static const getCustomerUser = 'customer-user';
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
  static const customerUserUpdate = 'customer-user/update';
  static const generateMagicLink = 'verification/generate-magic-link';
  static const focalPersonCreate = 'focal-person/create';
  static const updatePassword = 'builder/update/password';
  static const emailCodeSend = 'verification/send/code';
  static const verifyCodeEmail = 'verification/verify/code';
  static const getFocalPerson = 'focal-person/builder/focal-persons';
  static const bankInfoCreated = 'bank-info/create';
}
