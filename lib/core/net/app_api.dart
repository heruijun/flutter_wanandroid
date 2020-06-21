import 'package:dio/dio.dart';

import 'api.dart';
import 'interceptors/api_interceptor.dart';

final HttpManager httpManager = new HttpManager();

class HttpManager extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'https://www.wanandroid.com/';
    interceptors..add(ApiInterceptor());
  }
}

class ResponseData extends BaseResponseData {
  bool get success => 0 == code;

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['errorCode'];
    message = json['errorMsg'];
    data = json['data'];
  }
}
