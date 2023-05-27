import 'package:dio/dio.dart';
import 'package:evlve/app/api/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

@Riverpod(keepAlive: true)
ApiClient api(ApiRef ref) {
  return ApiClient(
    Dio(
      BaseOptions(
        baseUrl: ApiPath.baseUrl,
        contentType: Headers.jsonContentType,
        headers: {
          'Origin': ApiPath.origin,
          'Referer': ApiPath.referer,
        },
      ),
    )..interceptors.add(
        LogInterceptor(),
      ),
  );
}

class ApiClient {
  ApiClient(this._dio);

  final Dio _dio;

  Future<Response<dynamic>> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) {
    return _dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<dynamic>> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  void addAuthHeader(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }
}
