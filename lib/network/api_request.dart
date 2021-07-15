import 'package:dio/dio.dart';
import 'package:dio_demo/utils/object_extensions.dart';

import 'joke_bean.dart';
import 'api_const.dart' as ApiConst;
class ApiRequest {
  static ApiRequest _instance = ApiRequest._internal();

  static ApiRequest get instance => _instance;

  late Dio _dio;

  ApiRequest._internal() {
    _dio = Dio();
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
    _dio.options.responseType = ResponseType.json;
    _dio.options.baseUrl = 'https://api.apiopen.top';
    _dio.interceptors.add(LogInterceptor(responseBody: true,requestHeader: false,responseHeader: false));
  }

  factory ApiRequest() {
    return _instance;
  }

  Future<JokeBean> getJoke(
      {int page = 1,
      int count = 1,
      String type = 'video',
      CancelToken? cancelToken}) async {
    var response = await _dio.get(ApiConst.getJoke,
        cancelToken: cancelToken,
        queryParameters: {'page': page, 'count': count, 'type': type});
    return response.map((e) => JokeBean.fromJson(e.data));
  }
}

