import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);
  final Dio _dio;

  // post request
  Future<Response> post({
    required String url,
    required Map<String, dynamic> body,
    required String token,
    String? contentType,
  }) async {
    final response = await _dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response;
  }
}
