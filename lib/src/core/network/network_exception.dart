import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'model/error_model.dart';

/// The NetworkExceptions class is a custom exception class that extends the Equatable class.
class NetworkExceptions extends Equatable implements Exception {
  late final String message;
  late final int? statusCode;

  NetworkExceptions.fromDioError(DioException dioException) {
    statusCode = dioException.response?.statusCode;

    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;

      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;

      case DioExceptionType.connectionError:
        if (dioException.message!.contains('SocketException')) {
          message = 'No Internet';
          break;
        } else {
          message = 'Unexpected error occurred';
          break;
        }

      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;

      case DioExceptionType.badResponse:
        message = NetworkErrorModel.fromJson(dioException.response?.data as Map<String, dynamic>).statusMessage ??
            'Unexpected bad response';
        break;

      case DioExceptionType.unknown:
        message = 'Unexpected error occurred';
        break;
    }
    message = 'Something went wrong';
  }

  @override
  List<Object?> get props => [message, statusCode];
}
