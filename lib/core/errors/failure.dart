import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure("Connection timeout with Api Server");
      case DioErrorType.sendTimeout:
        return ServerFailure("Send timeout with Api Server");
      case DioErrorType.receiveTimeout:
        return ServerFailure("Receive timeout with Api Server");
      case DioErrorType.response:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure("Request to ApiServer was cancelled");
      case DioErrorType.other:
        {
          if (dioError.message.contains("SocketException")) {
            return ServerFailure("No Internet Connection ");
          }
          return ServerFailure("UnExpected Error, Please try again later ");
        }
      default:
        return ServerFailure("UnExpected Error, Please try again later ");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          "Your request not found,Please try again later  404");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server error, Please try again later !");
    } else {
      return ServerFailure("Some thing went wrong,Please try again later ! ");
    }
  }
}
