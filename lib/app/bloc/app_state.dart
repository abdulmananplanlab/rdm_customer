part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({
    this.user = User.loading,
  });

  final User user;

  AppState copyWith({
    User? user,
    bool? onboarded,
  }) {
    return AppState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        user,
      ];
}

extension AppStateValues on AppState {
  bool get isAuthenticated => user.isAuthenticated;

  bool get isNotAuthenticated => user.isNotAuthenticated;

  bool get isLoading => user.isLoading;
}
