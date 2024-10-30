import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/two_fa_authentication_app/repository/two_fa_authenticator_repository.dart';

part 'two_fa_authentication_app_state.dart';

class TwoFaAuthenticationAppCubit extends Cubit<TwoFaAuthenticationAppState> {
  TwoFaAuthenticationAppCubit({
    required this.twoFaAuthenticatorRepository,
    required this.token,
  }) : super(const TwoFaAuthenticationAppState());

  final TwoFaAuthenticatorRepository twoFaAuthenticatorRepository;
  final String token;

  void authenticatorCode(String value) {
    final token = General.dirty(value);
    emit(
      state.copyWith(
        token: token,
        status: Formz.validate([token]),
      ),
    );
  }

  Future<void> authenticatorAppCode() async {
    if (!state.status.isValidated) return;
    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
        dataState: state.dataState.toLoading(),
      ),
    );

    try {
      final data = await twoFaAuthenticatorRepository.getTwoFaAuthenticator(
        tokenCode: state.token.value,
        token: token,
      );
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          dataState: state.dataState.toLoaded(data: data),
        ),
      );
    } on InternalServerException catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          dataState: state.dataState.toFailure(error: error),
        ),
      );
    } on BadRequestException catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          dataState: state.dataState.toFailure(error: 'Invalid Code'),
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          dataState: state.dataState.toFailure(error: error),
        ),
      );
    }
  }
}
