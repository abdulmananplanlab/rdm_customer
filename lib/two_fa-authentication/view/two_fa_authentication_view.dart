part of 'view.dart';

class TwoFaAuthenticationView extends StatelessWidget {
  const TwoFaAuthenticationView({
    super.key,
    this.isSupport = false,
  });

  final bool? isSupport;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.qrImageSignUpDataSate != current.qrImageSignUpDataSate,
          listener: (context, state) {
            if (state.qrImageSignUpDataSate.isFailure) {
              context.read<AuthCubit>().hideLoading();
              context.errorSnackbar(state.qrImageSignUpDataSate.errorMessage);
            }
            if (state.qrImageSignUpDataSate.isLoaded) {
              context
                  .read<AuthCubit>()
                  .generateAuthenticationQrSecretKeyForSignUp();
            }
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.secretKeySignUpDataSate !=
              current.secretKeySignUpDataSate,
          listener: (context, state) {
            if (state.secretKeySignUpDataSate.isFailure) {
              context.read<AuthCubit>().hideLoading();
              context.errorSnackbar(state.secretKeySignUpDataSate.errorMessage);
            }
            if (state.secretKeySignUpDataSate.isLoaded) {
              context.read<AuthCubit>().hideLoading();
              Navigator.push(
                context,
                MaterialPageRoute<TwoFaAuthenticatorAppPage>(
                  builder: (_) => const TwoFaAuthenticatorAppPage(),
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(
          title: '2FA Activation',
        ),
        backgroundColor: context.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomProgressBar(),
              const SizedBox(height: 24),
              Text(
                'Step 1 of 5',
                style: context.sixteen500.withColor(context.primary500),
              ),
              const SizedBox(height: 8),
              const CustomTitleSubtitle(
                title: '2Factor Authentication',
                subtitle:
                    'Two Factor Authentication (2FA) helps prevent unauthorized access.',
              ),
              const SizedBox(height: 32),
              Text(
                'Choose your preferred MFA method:',
                style: context.sixteen600,
              ),
              TwoFaSelectedWidget(),
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
              const SizedBox(height: 16),
              if (isSupport == false)
                Center(
                  child: RichTextWidgets(
                    colorTextStyle:
                        context.twelve500.withColor(context.primary500),
                    style: context.twelve400,
                    colorTitle: 'Customer Support',
                    simpleTitle: "Facing issues? We're here to assist. ",
                    onTap: (context) {},
                  ),
                )
              else
                const SizedBox.shrink(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class TwoFaSelectedWidget extends StatelessWidget {
  const TwoFaSelectedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TwoFaAuthenticationCubit, TwoFaAuthenticationState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 24),
            CustomBorderListTiles(
              title: 'Phone Number',
              subTitle: 'Receive a code at +1 234 567 890',
              icon: AssetIcons.new_message,
              onTap: (context) {
                context.read<TwoFaAuthenticationCubit>().selectMethod(1);

                Navigator.push(
                  context,
                  MaterialPageRoute<TwoFaActivationPage>(
                    builder: (_) => const TwoFaActivationPage(),
                  ),
                );
              },
              isColor: state.selectedIndex == 1,
            ),
            const SizedBox(height: 16),
            CustomBorderListTiles(
              title: 'Authenticator App',
              subTitle: 'Retrieve the 6 digit code from authenticator app.',
              icon: AssetIcons.authenticator_app,
              onTap: (context) {
                context.read<TwoFaAuthenticationCubit>().selectMethod(2);

                final authCubit = context.read<AuthCubit>();
                authCubit.showLoading();
                authCubit.generateAuthenticationQrImageForSignUp();
              },
              isColor: state.selectedIndex == 2,
            ),
          ],
        );
      },
    );
  }
}
