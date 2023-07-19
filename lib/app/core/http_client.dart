import 'package:dio/dio.dart';

abstract class HttpClient {
  Future<Response> get(String url);
  Future<Response> post(String url, {data, queryParameters});
  Future<Response> put(String url, {data, queryParameters});
  Future<Response> delete(String url);
}

class DioHttpClient implements HttpClient {
  final Dio dio;

  DioHttpClient({required this.dio});

  @override
  Future<Response> get(String url) async {
    return await dio.get(url);
  }

  @override
  Future<Response> post(String url, {data, queryParameters}) async {
    return await dio.post(url, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response> put(String url, {data, queryParameters}) async {
    return await dio.put(url, data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response> delete(String url) async {
    return await dio.delete(url);
  }
}
