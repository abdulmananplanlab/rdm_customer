import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/auth/two_factor_forgot_password/repository/repository.dart';
import 'package:rdm_builder_customer/auth/two_factor_login/model/authenticator_model.dart';
import 'package:rdm_builder_customer/auth/two_factor_login/repository/repository.dart';
import 'package:rdm_builder_customer/auth/two_factor_sign_up/model/authenticator_model.dart';
import 'package:rdm_builder_customer/auth/two_factor_sign_up/repository/repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.twoFactorLoginRepository,
    required this.twoFactorForgotRepository,
    required this.twoFactorSignRepository,
    this.token,
    this.id,
  }) : super(const AuthState());
  final TwoFactorLoginRepository twoFactorLoginRepository;
  final TwoFactorForgotRepository twoFactorForgotRepository;
  final TwoFactorSignRepository twoFactorSignRepository;
  final String? token;
  final String? id;
  Timer? timer;

  // show Loading
  void showLoading() {
    emit(state.copyWith(isLoading: true));
  }

// hide Loading
  void hideLoading() {
    emit(state.copyWith(isLoading: false));
  }

// phoneNumber Validation for signUp
  void phoneNumber(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        otpPhoneNumberSignUp: phoneNumber,
        status: Formz.validate([phoneNumber]),
      ),
    );
  }

// phone number otp verified for signUp
  void otpPhoneNumberVerified(String value) {
    final signUpOtp = General.dirty(value);
    $debugLog('opt screen $signUpOtp');
    emit(
      state.copyWith(
        otpSignUpPhoneVerified: signUpOtp,
        status: Formz.validate([signUpOtp]),
      ),
    );
  }
// phone number otp verified for  login

  void otpPhoneNumberVerifiedLogin(String value) {
    final loginOtp = General.dirty(value);
    $debugLog(loginOtp);
    emit(
      state.copyWith(
        otpPhoneNumberVerifiedLogin: loginOtp,
        status: Formz.validate([loginOtp]),
      ),
    );
  }

// magic link api for sign up
  Future<void> magicLinkSend({required String email}) async {
    emit(
      state.copyWith(
        magicLinkSendDataState: state.magicLinkSendDataState.toLoading(),
      ),
    );
    try {
      await twoFactorSignRepository.verificationCodeGenerate(
        token: state.signUpDataSate.data?.token ?? token ?? '',
        email: email,
      );
      emit(
        state.copyWith(
          magicLinkSendDataState: state.magicLinkSendDataState.toLoaded(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          magicLinkSendDataState:
              state.magicLinkSendDataState.toFailure(error: e),
        ),
      );
    }
  }

  Future<void> magicLinkSendLogin({required String email}) async {
    emit(
      state.copyWith(
        magicLinkSendLoginDataState:
            state.magicLinkSendLoginDataState.toLoading(),
      ),
    );
    try {
      await twoFactorSignRepository.verificationCodeGenerate(
        token: state.loginDataState.data?.token ?? token ?? '',
        email: email,
      );
      emit(
        state.copyWith(
          magicLinkSendLoginDataState:
              state.magicLinkSendLoginDataState.toLoaded(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          magicLinkSendLoginDataState:
              state.magicLinkSendLoginDataState.toFailure(error: e),
        ),
      );
    }
  }

// phone number otp login
  Future<bool> loginPhoneNumberOtp() async {
    emit(
      state.copyWith(
        phoneNumberLoginDataSate: state.phoneNumberLoginDataSate.toLoading(),
      ),
    );
    try {
      await twoFactorLoginRepository.loginPhoneNumberOtp(
        otp: state.loginDataState.data?.phoneNo ?? 'No Phone Number',
        token: state.loginDataState.data?.token ?? 'No Token',
      );
      emit(
        state.copyWith(
          phoneNumberLoginDataSate: state.phoneNumberLoginDataSate.toLoaded(),
        ),
      );
      return true;
    } catch (error) {
      emit(
        state.copyWith(
          phoneNumberLoginDataSate:
              state.phoneNumberLoginDataSate.toFailure(error: error),
        ),
      );
      $debugLog(error);
      return false;
    }
  }

  Future<void> otpPhoneNumber() async {
    try {
      await twoFactorForgotRepository.otpPhoneNumber(
        otp: state.otpPhoneNumberForgot.value,
      );
    } catch (e) {
      log(e.toString());
      $debugLog(e);
    }
  }

  Future<void> otpEmail() async {
    try {
      await twoFactorForgotRepository.otpEmail(
        otp: state.otpEmailForgot.value,
      );
    } catch (e) {
      log(e.toString());
      $debugLog(e);
    }
  }

  Future<void> authenticatorAppCode() async {
    try {
      await twoFactorForgotRepository.authenticatorAppCode(
        code: state.authenticatorCodeForgot.value,
      );
    } catch (e) {
      log(e.toString());
      $debugLog(e);
    }
  }
// phone number send otp api call

  Future<void> signUpPhoneNumberAuthentication() async {
    if (!state.status.isValidated) return;
    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
        phoneNumberSignUpDataSate: state.phoneNumberSignUpDataSate.toLoading(),
      ),
    );

    try {
      await twoFactorSignRepository.phoneNumberOtpSignUp(
        otp: state.otpPhoneNumberSignUp.value,
        token: state.signUpDataSate.data?.token ??
            token ??
            state.loginDataState.data?.token ??
            'No Token',
      );

      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          phoneNumberSignUpDataSate: state.phoneNumberSignUpDataSate.toLoaded(),
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          phoneNumberSignUpDataSate:
              state.phoneNumberSignUpDataSate.toFailure(error: error),
        ),
      );
    }
  }

// phone number otp verified api call for signup
  Future<void> phoneNumberOtpVerifiedSignUp() async {
    if (!state.status.isValidated) return;
    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
        otpSignUpVerifiedDataState:
            state.otpSignUpVerifiedDataState.toLoading(),
      ),
    );
    try {
      await twoFactorSignRepository.phoneNumberOtpVerified(
        token: state.signUpDataSate.data?.token ??
            token ??
            state.loginDataState.data?.token ??
            'No Token',
        phoneNumber: state.otpPhoneNumberSignUp.value,
        otp: state.otpSignUpPhoneVerified.value,
      );
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          otpSignUpVerifiedDataState:
              state.otpSignUpVerifiedDataState.toLoaded(),
        ),
      );
    } on BadRequestException catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          otpSignUpVerifiedDataState:
              state.otpSignUpVerifiedDataState.toFailure(error: 'Invalid otp'),
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          otpSignUpVerifiedDataState:
              state.otpSignUpVerifiedDataState.toFailure(error: error),
        ),
      );
    }
  }

  // phone number otp verified api call for login
  Future<void> phoneNumberOtpVerifiedLogin() async {
    if (!state.status.isValidated) return;
    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
        otpLoginVerifiedDataState: state.otpLoginVerifiedDataState.toLoading(),
      ),
    );
    try {
      await twoFactorLoginRepository.phoneNumberOtpVerifiedLogin(
        token: state.loginDataState.data?.token ?? token ?? 'No Token',
        phoneNumber:
            state.loginDataState.data?.phoneNo ?? token ?? 'No Phone Number',
        otp: state.otpPhoneNumberVerifiedLogin.value,
      );
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          otpLoginVerifiedDataState: state.otpLoginVerifiedDataState.toLoaded(),
        ),
      );
    } on BadRequestException catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          otpLoginVerifiedDataState:
              state.otpLoginVerifiedDataState.toFailure(error: 'Invalid OTP'),
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          otpLoginVerifiedDataState:
              state.otpLoginVerifiedDataState.toFailure(error: error),
        ),
      );
    }
  }

// signup data store in this code
  void signUpData(UserEntity data) {
    emit(
      state.copyWith(
        signUpDataSate: state.signUpDataSate.toLoaded(data: data),
      ),
    );
    $debugLog(state.signUpDataSate.data?.createdAt);
    $debugLog(state.signUpDataSate.data?.qrCodeSecret);
  }

  // login data store in this code
  void loginData(UserEntity data) {
    emit(
      state.copyWith(
        loginDataState: state.loginDataState.toLoaded(data: data),
      ),
    );
  }

// this authenticator qr image for sign up
  Future<bool> generateAuthenticationQrImageForSignUp() async {
    emit(
      state.copyWith(
        qrImageSignUpDataSate: state.qrImageSignUpDataSate.toLoading(),
      ),
    );
    try {
      final data = await twoFactorSignRepository.authenticatorQrImageSignUp(
        token: state.signUpDataSate.data?.token ??
            token ??
            state.loginDataState.data?.token ??
            'No Token',
      );
      emit(
        state.copyWith(
          qrImageSignUpDataSate:
              state.qrImageSignUpDataSate.toLoaded(data: data),
        ),
      );
      return true;
    } catch (error) {
      emit(
        state.copyWith(
          qrImageSignUpDataSate:
              state.qrImageSignUpDataSate.toFailure(error: error),
        ),
      );
      return false;
    }
  }

  // this authenticator qr secret key for sign up
  Future<bool> generateAuthenticationQrSecretKeyForSignUp() async {
    emit(
      state.copyWith(
        secretKeySignUpDataSate: state.secretKeySignUpDataSate.toLoading(),
      ),
    );
    try {
      final data = await twoFactorSignRepository.authenticatorSecretKeySignUp(
        token: state.signUpDataSate.data?.token ??
            token ??
            state.loginDataState.data?.token ??
            'No Token',
      );

      emit(
        state.copyWith(
          secretKeySignUpDataSate:
              state.secretKeySignUpDataSate.toLoaded(data: data),
        ),
      );
      return true;
    } catch (error) {
      emit(
        state.copyWith(
          secretKeySignUpDataSate:
              state.secretKeySignUpDataSate.toFailure(error: error),
        ),
      );
      return false;
    }
  }

  // this authenticator qr image for login
  Future<bool> authenticationAppQrImageLogin() async {
    emit(
      state.copyWith(
        authenticatorLoginDataSate:
            state.authenticatorLoginDataSate.toLoading(),
      ),
    );
    try {
      final data =
          await twoFactorLoginRepository.generateQrImageForAuthenticatorLogin(
        token: state.loginDataState.data?.token ?? token,
      );
      emit(
        state.copyWith(
          authenticatorLoginDataSate:
              state.authenticatorLoginDataSate.toLoaded(data: data),
        ),
      );
      return true;
    } catch (error) {
      emit(
        state.copyWith(
          authenticatorLoginDataSate:
              state.authenticatorLoginDataSate.toFailure(error: error),
        ),
      );
      return false;
    }
  }

// this authenticator code for login
  void authenticationCodeLogin(String value) {
    final token = General.dirty(value);
    emit(
      state.copyWith(
        token: token,
        status: Formz.validate([token]),
      ),
    );
  }

// this authenticator code for login
  Future<void> authenticationAppCodeLogin() async {
    if (!state.status.isValidated) return;
    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
        authenticatorLoginDataSate:
            state.authenticatorLoginDataSate.toLoading(),
      ),
    );

    try {
      await twoFactorLoginRepository.getTwoFaAuthenticatorCodeLogin(
        tokenCode: state.token.value,
        token: state.loginDataState.data?.token ?? token ?? 'No Token',
      );
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          authenticatorLoginDataSate:
              state.authenticatorLoginDataSate.toLoaded(),
        ),
      );
    } on BadRequestException catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          authenticatorLoginDataSate:
              state.authenticatorLoginDataSate.toFailure(error: 'Invalid Code'),
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          authenticatorLoginDataSate:
              state.authenticatorLoginDataSate.toFailure(error: error),
        ),
      );
    }
  }
// this authenticator code for sign up

  Future<void> authenticatorAppCodeSignUp() async {
    try {
      await twoFactorSignRepository.authenticatorOtpSignUp(
        code: state.authenticatorCodeSignUp.value,
      );
    } catch (e) {
      log(e.toString());
      $debugLog(e);
    }
  }

  void startTimer() {
    timer = Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        if (state.getUserLoginDataState.data?.isEmailVerified ?? false) {
          timer.cancel();
        } else {
          getUserBuilderLogin();
        }
      },
    );
  }

  void cancelTimer() {
    timer?.cancel();
    timer = null;
  }

  @override
  Future<void> close() {
    cancelTimer(); // Ensure the timer is stopped when cubit is disposed
    return super.close();
  }

// this api to get latest user
  Future<void> getUserBuilder() async {
    emit(
      state.copyWith(
        getUserDataState: state.getUserDataState.toLoading(),
      ),
    );
    try {
      final data = await twoFactorSignRepository.getUser(
        id: state.signUpDataSate.data?.id ??
            id ??
            state.loginDataState.data?.id ??
            'No id',
        token: state.signUpDataSate.data?.token ??
            token ??
            state.loginDataState.data?.token ??
            'No Token',
      );

      emit(
        state.copyWith(
          getUserDataState: state.getUserDataState.toLoaded(data: data),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getUserDataState: state.getUserDataState.toFailure(error: e),
        ),
      );
    }
  }

  Future<void> getUserBuilderAgreement() async {
    emit(
      state.copyWith(
        getUserAgreementDataState: state.getUserAgreementDataState.toLoading(),
      ),
    );
    try {
      final data = await twoFactorSignRepository.getUser(
        id: state.signUpDataSate.data?.id ??
            id ??
            state.loginDataState.data?.id ??
            'No id',
        token: state.signUpDataSate.data?.token ??
            token ??
            state.loginDataState.data?.token ??
            'No Token',
      );

      emit(
        state.copyWith(
          getUserAgreementDataState:
              state.getUserAgreementDataState.toLoaded(data: data),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getUserAgreementDataState:
              state.getUserAgreementDataState.toFailure(error: e),
        ),
      );
    }
  }

  Future<void> getUserBuilderDocument() async {
    emit(
      state.copyWith(
        getUserDocumentDataState: state.getUserDocumentDataState.toLoading(),
      ),
    );
    try {
      final data = await twoFactorSignRepository.getUser(
        id: state.signUpDataSate.data?.id ??
            id ??
            state.loginDataState.data?.id ??
            'No id',
        token: state.signUpDataSate.data?.token ??
            token ??
            state.loginDataState.data?.token ??
            'No Token',
      );

      emit(
        state.copyWith(
          getUserDocumentDataState:
              state.getUserDocumentDataState.toLoaded(data: data),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getUserDocumentDataState:
              state.getUserDocumentDataState.toFailure(error: e),
        ),
      );
    }
  }

  // this api to get latest user in login button when email not verified
  Future<void> getUserBuilderLogin() async {
    emit(
      state.copyWith(
        getUserLoginDataState: state.getUserLoginDataState.toLoading(),
      ),
    );
    try {
      final data = await twoFactorSignRepository.getUser(
        id: state.signUpDataSate.data?.id ??
            id ??
            state.loginDataState.data?.id ??
            'No id',
        token: state.signUpDataSate.data?.token ??
            token ??
            state.loginDataState.data?.token ??
            'No Token',
      );

      emit(
        state.copyWith(
          getUserLoginDataState:
              state.getUserLoginDataState.toLoaded(data: data),
        ),
      );
      $debugLog(state.getUserLoginDataState.data?.isEmailVerified);
    } catch (e) {
      emit(
        state.copyWith(
          getUserLoginDataState:
              state.getUserLoginDataState.toFailure(error: e),
        ),
      );
    }
  }

  Future<void> getUserBuilderAuthenticator() async {
    emit(
      state.copyWith(
        getUserAuthenticatorDataState:
            state.getUserAuthenticatorDataState.toLoading(),
      ),
    );
    try {
      final data = await twoFactorSignRepository.getUser(
        id: state.signUpDataSate.data?.id ??
            id ??
            state.loginDataState.data?.id ??
            'No id',
        token: state.signUpDataSate.data?.token ??
            token ??
            state.loginDataState.data?.token ??
            'No Token',
      );

      emit(
        state.copyWith(
          getUserAuthenticatorDataState:
              state.getUserAuthenticatorDataState.toLoaded(data: data),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getUserAuthenticatorDataState:
              state.getUserAuthenticatorDataState.toFailure(error: e),
        ),
      );
    }
  }
}
