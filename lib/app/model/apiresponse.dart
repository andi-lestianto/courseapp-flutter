class ApiResponse<T> {
  ReqStatus? reqStatus;
  T? data;
  String? message;

  ApiResponse(this.reqStatus, this.data, this.message);

  ApiResponse.initial() : reqStatus = ReqStatus.initial;

  ApiResponse.loading() : reqStatus = ReqStatus.loading;

  ApiResponse.done(this.data) : reqStatus = ReqStatus.done;

  ApiResponse.error(this.message) : reqStatus = ReqStatus.error;
}

enum ReqStatus {
  initial,
  loading,
  done,
  error,
}
