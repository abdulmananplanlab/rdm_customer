part of 'view.dart';

class AccountVerificationView extends StatelessWidget {
  const AccountVerificationView({
    super.key,
    this.isEmailAvailable = false,
    this.iaPasswordAvailable = false,
    this.isForgotPassword = false,
  });

  final bool isEmailAvailable;
  final bool iaPasswordAvailable;
  final bool isForgotPassword;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.phoneNumberLoginDataSate !=
              current.phoneNumberLoginDataSate,
          listener: (context, state) {
            if (state.phoneNumberLoginDataSate.isFailure) {
              context.read<AuthCubit>().hideLoading();
              context
                  .errorSnackbar(state.phoneNumberLoginDataSate.errorMessage);
            }
            if (state.phoneNumberLoginDataSate.isLoaded) {
              context.read<AuthCubit>().hideLoading();
              final accountVerificationCubit =
                  context.read<AccountVerificationCubit>().state.selectedIndex;
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => PhoneNumberAccountVerification(
                    selectedIndexState: accountVerificationCubit,
                    isEmailAvailable: isEmailAvailable,
                  ),
                ),
              );
            }
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.authenticatorLoginDataSate !=
              current.authenticatorLoginDataSate,
          listener: (context, state) {
            if (state.authenticatorLoginDataSate.isFailure) {
              context.read<AuthCubit>().hideLoading();

              context
                  .errorSnackbar(state.authenticatorLoginDataSate.errorMessage);
            }
            if (state.authenticatorLoginDataSate.isLoaded) {
              context.read<AuthCubit>().hideLoading();
              Navigator.push(
                context,
                MaterialPageRoute<AuthenticationCodePage>(
                  builder: (_) => AuthenticationCodePage(
                    isForgetPassword: isForgotPassword,
                  ),
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Sign In',
        ),
        backgroundColor: context.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTitleSubtitle(
                title: 'Account Verification',
                subtitle:
                    'Choose an account verification method to ${iaPasswordAvailable ? "reset your password?" : ' sign in to your Account?'} ',
              ),
              SelectedAccountVerificationWidget(
                isEmailAvailable: isEmailAvailable,
                isForgotPassword: isForgotPassword,
              ),
              const Spacer(),
              BlocBuilder<AuthCubit, AuthState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading,
                builder: (context, state) {
                  return state.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container();
                },
              ),
              // AccountVerificationButton(
              //   isEmailAvailable: isEmailAvailable,
              //   isForgotPassword: isForgotPassword,
              // ),
              const SizedBox(height: 16),
              Center(
                child: RichTextWidgets(
                  colorTextStyle: context.twelve500.withColor(
                    context.primary500,
                  ),
                  style: context.twelve400,
                  colorTitle: 'Customer Support',
                  simpleTitle: "Facing issues? We're here to assist. ",
                  onTap: (context) {},
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
