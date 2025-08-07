import 'package:auto_swift/core/api/api_consumer.dart';
import 'package:auto_swift/core/api/api_end_points.dart';
import 'package:auto_swift/core/errors/exeptions.dart';
import 'package:dio/dio.dart';


class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer(this.dio) {
    dio.options.baseUrl = ApiEndPoints.baseUrl;
    dio.interceptors.add(
      LogInterceptor(request: true, requestBody: true, responseBody: true),
    );
  }

  @override
  Future delete(
    String path,
    data, {
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExeptions(e);
    }
  }

  @override
  Future get(
    String path,
    data, {
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExeptions(e);
    }
  }

  @override
  Future post(
    String path,
    data, {
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExeptions(e);
    }
  }

  @override
  Future update(
    String path,
    data, {
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExeptions(e);
    }
  }
}
