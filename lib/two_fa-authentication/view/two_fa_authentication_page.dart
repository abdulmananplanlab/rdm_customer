part of 'view.dart';

class TwoFaAuthenticationPage extends StatelessWidget {
  const TwoFaAuthenticationPage({
    super.key,
    this.isSupport = false,
  });
  static String route() => '/TwoFaAuthenticationPage/:isSupport';

  final bool? isSupport;

  @override
  Widget build(BuildContext context) {
    return LifecycleObserver(
      onInit: () {
        final user = context.read<AuthCubit>().state.signUpDataSate.data;
        if (user != null && user.token != null) {
          context
              .read<AuthRepository>()
              .updateBuilderUser(User.fromEntity(user));
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TwoFaAuthenticationCubit>(
            create: (context) => TwoFaAuthenticationCubit(),
          ),
          BlocProvider<AccountVerificationCubit>(
            create: (context) => AccountVerificationCubit(),
          ),
        ],
        child: TwoFaAuthenticationView(
          isSupport: isSupport,
        ),
      ),
    );
  }
}
