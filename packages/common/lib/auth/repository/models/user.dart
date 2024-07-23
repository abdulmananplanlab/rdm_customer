part of 'models.dart';

class User extends Equatable {
  const User({
    this.id = '',
    this.name,
    this.email,
    this.jwt = '',
    this.password,
    this.scope,
  });

  factory User.fromEntity(
    UserEntity entity, {
    String? token,
    String? password,
  }) {
    return User(
      id: entity.id ?? '',
      name: entity.name,
      email: entity.email,
      scope: entity.scope,
      jwt: token ?? entity.jwt ?? '',
      password: password ?? entity.password,
    );
  }

  factory User.fromJson(JsonObject json) =>
      User.fromEntity(UserEntity.fromJson(json));

  final String id;
  final String? name;
  final String? email;
  final String? scope;
  final String jwt;
  final String? password;

  static const empty = User();
  static const loading = User(scope: 'loading');

  UserEntity toEntity() => UserEntity(
        id: id,
        name: name,
        email: email,
        scope: scope,
        jwt: jwt,
        password: password,
      );

  JsonObject toJson() => toEntity().toJson();

  User copyWith({
    String? id,
    String? name,
    String? email,
    bool? emailVerified,
    String? scope,
    String? jwt,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      scope: scope ?? this.scope,
      jwt: jwt ?? this.jwt,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        scope,
        jwt,
        password,
      ];

  

  bool get isEmpty => id.isEmpty;

  bool get isNotEmpty => !isEmpty;

  bool get isAuthenticated => isNotEmpty && jwt.isNotEmpty;

  bool get isNotAuthenticated => !isAuthenticated;

  bool get isLoading => this == loading;

  String get firstName => name?.split(' ').firstOrNull?.capitalize() ?? '';
}
