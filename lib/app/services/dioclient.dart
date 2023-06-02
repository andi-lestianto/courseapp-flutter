import 'package:courseapp/app/model/apiresponse.dart';
import 'package:courseapp/app/services/endpoint.dart';
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio()
    ..options.baseUrl = EndPoint.baseUrl
    ..options.connectTimeout = Duration(seconds: 15)
    ..options.receiveTimeout = Duration(seconds: 15)
    ..options.responseType = ResponseType.json
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Do something before request is sent.
          // If you want to resolve the request with custom data,
          // you can resolve a `Response` using `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject with a `DioError` using `handler.reject(dioError)`.
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          if (response.statusCode == 401) {}
          // Do something with response data.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object using `handler.reject(dioError)`.
          return handler.next(response);
        },
        onError: (DioError e, ErrorInterceptorHandler handler) {
          // Do something with response error.
          // If you want to resolve the request with some custom data,
          // you can resolve a `Response` object using `handler.resolve(response)`.
          return handler.next(e);
        },
      ),
    );

  ApiResponse apiResponse = ApiResponse.loading();

  Future<ApiResponse> get(String url) async {
    try {
      apiResponse = ApiResponse.loading();
      final Response response = await dio.get(url);
      if (response.statusCode == 200) {
        apiResponse = ApiResponse.done(response.data);
      }
      return apiResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> post(String url, Map<String, dynamic> data) async {
    try {
      apiResponse = ApiResponse.loading();
      final Response response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        apiResponse = ApiResponse.done(response.data);
      }
      return apiResponse;
    } on DioError catch (e) {
      if (e.response != null) {
        apiResponse = ApiResponse.error(e.response!.data['message']);
        return apiResponse;
      }
      return ApiResponse.error('Terjadi Kesalahan');
    } catch (e) {
      apiResponse = ApiResponse.error(e.toString());
      return apiResponse;
    }
  }
}
