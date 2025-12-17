import 'status.dart';

class ApiResponse<T> {
  T? data;
  Status? status;
  String? message;

  ApiResponse({this.data, this.message, this.status});

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status\nMessage: $message\nData: $data";
  }
}
