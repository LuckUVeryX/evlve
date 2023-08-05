import 'dart:convert';

import 'package:evlve/modules/qr/qr.dart';
import 'package:evlve/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'qr_pref_repo.g.dart';

@riverpod
QRPrefRepo qrPrefRepo(QrPrefRepoRef ref) {
  return QRPrefRepo(ref.watch(sharedPreferencesProvider));
}

class QRPrefRepo {
  const QRPrefRepo(this._pref);

  final SharedPreferences _pref;

  static const _qrKey = 'kQR';
  QRModel get qrPref {
    final json = _pref.getString(_qrKey);
    if (json == null) return const QRModel();
    return QRModel.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  Future<void> saveQRPref(QRModel value) {
    return _pref.setString(_qrKey, jsonEncode(value.toJson()));
  }
}
