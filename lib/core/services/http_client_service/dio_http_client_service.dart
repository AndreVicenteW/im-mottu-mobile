import 'package:flutter/cupertino.dart';
import 'package:im_mottu_mobile/core/services/http_client_service/http_client_service.dart';
import 'package:dio/dio.dart';

class DioHttpClientService extends HttpClientService {
  final Dio _dio;
  final _cache = <Uri, Response>{};

  DioHttpClientService(this._dio);

  DioHttpClientService.withDefaultParams(this._dio) {
    _dio.interceptors.add(_defaultParamsInterceptor());
  }

  InterceptorsWrapper _defaultParamsInterceptor() => InterceptorsWrapper(
      onRequest: _onRequest,
      onError: _onError,
      onResponse: (res, handler) async {
        _onResponseLog(res);
        _saveCache(res);
        return handler.next(res);
      });

  dynamic _onRequest(RequestOptions opts, handler) async {
    var cachedResponse = _checkResponseIsCached(opts.uri);
    if (cachedResponse != null) {
      _onRequestLog(opts, fromCache: true);
      return handler.resolve(cachedResponse);
    } else {
      _onRequestLog(opts);
      return handler.next(opts);
    }
  }

  dynamic _onError(DioException err, handler) {
    var isConnectionError = err.type == DioExceptionType.connectionError;

    if (isConnectionError) {
      _getCache(err.requestOptions.uri, handler);
    }

    _onErrorLog(err);
    return handler.next(err);
  }

  dynamic _getCache(Uri uri, handler) {
    var cachedResponse = _checkResponseIsCached(uri);
    if (cachedResponse != null) {
      return handler.resolve(cachedResponse);
    }
  }

  Response? _checkResponseIsCached(Uri uri) {
    return _cache[uri];
  }

  void _saveCache(Response res) {
    var key = res.requestOptions.uri;
    _cache[key] = res;
  }

  void _onRequestLog(
    RequestOptions options, {
    fromCache = false,
  }) {
    debugPrint('====================  REQUEST LOG  ====================');
    debugPrint('METHOD CALLED: ${options.method}');
    debugPrint('PATH CALLED: ${options.path}');
    debugPrint('BODY: ${options.data}');
    if (fromCache) {
      debugPrint('CACHED');
    }
    debugPrint('=======================================================');
  }

  void _onResponseLog(Response res) {
    debugPrint('====================  RESPONSE LOG  ====================');
    debugPrint('METHOD CALLED: ${res.requestOptions.method}');
    debugPrint('PATH CALLED: ${res.requestOptions.path}');
    debugPrint('BODY: ${res.data}');
    debugPrint('========================================================');
  }

  void _onErrorLog(DioException e) {
    debugPrint('====================  Error LOG  ====================');
    debugPrint('METHOD CALLED: ${e.requestOptions.method}');
    debugPrint('PATH CALLED: ${e.requestOptions.path}');
    debugPrint('ERROR: ${e.error}');
    debugPrint('=====================================================');
  }

  @override
  Future delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.delete(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }

  @override
  Future get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }

  @override
  Future patch(
    String url, {
    Map? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.patch(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }

  @override
  Future post(
    String url, {
    Map? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.post(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }

  @override
  Future put(
    String url, {
    Map? body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.put(
      url,
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }
}
