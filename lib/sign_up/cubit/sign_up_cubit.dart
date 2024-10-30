import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/sign_up/repository/model/sign_up_model.dart';
import 'package:rdm_builder_customer/sign_up/repository/repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpRepository, required this.authCubit})
      : super(const SignUpState());
  final SignUpRepository signUpRepository;
  final void Function(SignUpModel) authCubit;

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
            [email, state.firstName, state.lastName, state.password]),
      ),
    );
  }

  void password(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(
            [password, state.email, state.firstName, state.lastName]),
      ),
    );
  }

  Future<void> signUpWithEmail() async {
    if (!state.status.isValidated) return;

    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
        signUpState: state.signUpState.toLoading(),
      ),
    );
    try {
      final data = await signUpRepository.signUpWithEmailPassword(
        firstName: state.firstName.value,
        lastName: state.lastName.value,
        email: state.email.value,
        password: state.password.value,
      );

      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          signUpState: state.signUpState.toLoaded(
            data: data,
          ),
        ),
      );
      authCubit(data);
    } catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          signUpState: state.signUpState.toFailure(
            error: error,
          ),
        ),
      );
    }
  }
}
