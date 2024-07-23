part of 'entity.dart';

class UserEntity {
  const UserEntity({
    this.id,
    this.name,
    this.email,
    this.jwt,
    this.scope,
    this.password,
  });

  factory UserEntity.fromJson(JsonObject json) => UserEntity(
        id: $cast(json['id'] ?? json['user_id']),
        name: $cast(json['full_name'] ?? json['name']),
        email: $cast(json['email']),
        jwt: $cast(json['jwt']),
        scope: $cast(json['scope']),
        password: $cast(json['password']),
      );

  final String? id;
  final String? name;
  final String? email;
  final String? jwt;
  final String? scope;
  final String? password;

  JsonObject toJson() => {
        'id': id,
        'full_name': name,
        'email': email,
        'scope': scope,
        'jwt': jwt,
        'password': password,
      };
}
