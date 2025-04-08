import 'dart:convert';

import 'package:dio/dio.dart';

class TestHelper {
  static Future createMockDioResponse(
    String json,
    int httpStatus, {
    RequestOptions? requestOptions,
    bool decode = true,
  }) async {
    return Response(
      data: decode ? jsonDecode(json) : json,
      statusCode: httpStatus,
      requestOptions: requestOptions ?? RequestOptions(path: ':path'),
    );
  }
}
