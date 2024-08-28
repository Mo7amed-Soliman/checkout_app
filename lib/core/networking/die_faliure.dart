import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;

  Failure(this.errmessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errmessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection time out for api service');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send time out for api service');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive time out for api service');
      case DioExceptionType.badCertificate:
        return ServerFailure(
          'Certificate is invalid Your browser failed to validate your certificate',
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statuscode: dioError.response!.statusCode!,
          response: dioError.response!.data,
        );
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection, please resolve it later');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure(
            'No internet connection, please resolve it later',
          );
        } else {
          return ServerFailure('oops there was an error  , please try later ');
        }
      case DioExceptionType.cancel:
        return ServerFailure('Requset to api service canceld');
      default:
        return ServerFailure('oops there was an error  , please try later ');
    }
  }

  factory ServerFailure.fromResponse(
      {required int statuscode, required dynamic response}) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statuscode == 404) {
      return ServerFailure('Your request not found , please try later');
    } else if (statuscode == 500) {
      return ServerFailure('internet server error  , please try later');
    } else {
      return ServerFailure('oops there was an error  , please try later ');
    }
  }
}
