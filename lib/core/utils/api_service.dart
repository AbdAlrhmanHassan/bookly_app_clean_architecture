import 'package:dio/dio.dart';

class ApiService {
  
  final Dio _dio;
  final _baseUrl = 'https://www.googleapis.com/books/v1/';

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String url}) async {
    Response response = await _dio.get('$_baseUrl$url');
    return response.data;
  }
}
