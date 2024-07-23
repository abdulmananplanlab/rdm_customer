import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/sign_up/repository/repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpRepository}) : super(const SignUpState());
  final SignUpRepository signUpRepository;

  void isVisible(bool? newVisible) {
    emit(state.copyWith(isVisible: newVisible));
  }

  void firstName(String value) {
    final firstName = General.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
        status: Formz.validate(
            [firstName, state.email, state.password, state.lastName]),
      ),
    );
  }

  void lastName(String value) {
    final lastName = General.dirty(value);
    emit(
      state.copyWith(
        lastName: lastName,
        status: Formz.validate(
            [lastName, state.email, state.password, state.firstName]),
      ),
    );
  }

  void email(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
            [email, state.lastName, state.password, state.firstName]),
      ),
    );
  }

  void password(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(
            [password, state.email, state.lastName, state.firstName]),
      ),
    );
  }

  Future<void> signUp() async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await signUpRepository.signUpWithEmailPassword(
          lastName: state.firstName.value,
          firstName: state.lastName.value,
          email: state.email.value,
          password: state.password.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
