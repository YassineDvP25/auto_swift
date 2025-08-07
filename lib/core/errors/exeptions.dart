import 'package:auto_swift/core/errors/error_response.dart';
import 'package:dio/dio.dart';

class ServerExeption implements Exception {
  final ErrorResponse errorResponse;
  ServerExeption(this.errorResponse);
}
handleDioExeptions(e){
    switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw ServerExeption(ErrorResponse.fromJson(e.response!.data));
        case DioExceptionType.sendTimeout:
          throw ServerExeption(ErrorResponse.fromJson(e.response!.data));

        case DioExceptionType.receiveTimeout:
          throw ServerExeption(ErrorResponse.fromJson(e.response!.data));

        case DioExceptionType.badCertificate:
          throw ServerExeption(ErrorResponse.fromJson(e.response!.data));

        case DioExceptionType.cancel:
          throw ServerExeption(ErrorResponse.fromJson(e.response!.data));

        case DioExceptionType.connectionError:
          throw ServerExeption(ErrorResponse.fromJson(e.response!.data));

        case DioExceptionType.unknown:
          throw ServerExeption(ErrorResponse.fromJson(e.response!.data));

        case DioExceptionType.badResponse:
          switch (e.response!.statusCode) {
            case 400:
              throw ServerExeption(ErrorResponse.fromJson(e.response!.data));
            case 401:
              throw ServerExeption(ErrorResponse.fromJson(e.response!.data));
            case 403:
              throw ServerExeption(ErrorResponse.fromJson(e.response!.data));
            case 404:
              throw ServerExeption(ErrorResponse.fromJson(e.response!.data));
            case 409:
              throw ServerExeption(ErrorResponse.fromJson(e.response!.data));
            case 422:
              throw ServerExeption(ErrorResponse.fromJson(e.response!.data));
            case 504:
              throw ServerExeption(ErrorResponse.fromJson(e.response!.data));
          }
      }
}