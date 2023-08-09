import 'dart:async';

import 'package:evlve/api/api.dart';
import 'package:evlve/modules/auth/models/models.dart';
import 'package:evlve/modules/user/user.dart';
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

  Future<LoginResponse> login({
    required String email,
    required String password,
    String? otp,
  }) async {
    final data = LoginRequest(
      login: email,
      password: password,
      verificationCode: otp,
    );
    final res = await _api.post(ApiPath.sessions, data: data.toJson());
    final response = LoginResponse.fromJson(res.data as Map<String, dynamic>);

    final token = response.token;
    if (token != null) unawaited(_saveAuthToken(token));

    return response;
  }

  Future<User> signInWithToken() async {
    final token = await _storage.read(key: _tokenKey);
    if (token == null) throw Exception();
    _api.addAuthHeader(token);

    final res = await _api.get(ApiPath.getMemberships);
    final memberships = (res.data as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList();
    return memberships!.first;
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
