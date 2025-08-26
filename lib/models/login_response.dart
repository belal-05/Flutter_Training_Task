import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String accessToken;
  final String refreshToken;

  const LoginResponse({required this.accessToken, required this.refreshToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        accessToken: json['access_token'],
        refreshToken: json['refresh_token'],
      );
  }

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
