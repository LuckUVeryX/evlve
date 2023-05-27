import 'dart:async';

import 'package:evlve/api/api.dart';
import 'package:evlve/modules/auth/models/models.dart';
import 'package:evlve/providers/providers.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repo.g.dart';

@riverpod
AuthRepo authRepo(AuthRepoRef ref) {
  return AuthRepo(ref.watch(apiProvider), ref.watch(secureStorageProvider));
}

class AuthRepo {
  const AuthRepo(this._api, this._storage);

  final ApiClient _api;
  final FlutterSecureStorage _storage;

  static const _tokenKey = 'auth_token';

  Future<SignInResponse> signIn({
    required String email,
    required String password,
    String? otp,
  }) async {
    final data = SignInRequest(
      login: email,
      password: password,
      verificationCode: otp,
    );
    final res = await _api.post(ApiPath.sessions, data: data.toJson());
    final response = SignInResponse.fromJson(res.data as Map<String, dynamic>);

    final token = response.token;
    if (token != null) unawaited(_saveAuthToken(token));

    return response;
  }

  Future<void> signInWithToken() async {
    final token = await _storage.read(key: _tokenKey);
    if (token == null) throw Exception();
    _api.addAuthHeader(token);
  }

  Future<void> signOut() async {
    _api.removeAuthHeader();
    return _storage.delete(key: _tokenKey);
  }

  Future<void> _saveAuthToken(String token) {
    _api.addAuthHeader(token);
    return _storage.write(key: _tokenKey, value: token);
  }
}
