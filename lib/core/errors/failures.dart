import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException  dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout With Api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With Api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With Api Server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request To Api Server Was Canceled');
      case DioExceptionType.unknown:
        if(dioError.message!.contains('SocketException')){
          return ServerFailure('No Internet Connection');
        }else{
          return ServerFailure('Unexpected Error Try Again Later!');
        }
      default:
        return ServerFailure('Some Thing Went Wrong Try Again Later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode,dynamic response){
    if(statusCode == 400 || statusCode == 401 || statusCode == 403){
      return ServerFailure(response['error']['message']);
    }else if(statusCode == 404){
      return ServerFailure('Your request not found,Please try again later!');
    }else if(statusCode == 500){
      return ServerFailure('Internal server error,Please try again later!');
    }else{
      return ServerFailure('Some Thing Went Wrong,Please Try Again Later');
    }
  }
}
