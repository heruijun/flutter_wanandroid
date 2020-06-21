import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../api.dart';
import '../app_api.dart';

/// 玩Android API
class ApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}');
//    debugPrint('---api-request--->data--->${options.data}');
    return options;
  }

  @override
  onResponse(Response response) {
//    debugPrint('---api-response--->resp----->${response.data}');
    ResponseData respData = ResponseData.fromJson(response.data);
    if (respData.success) {
      response.data = respData.data;
      return httpManager.resolve(response);
    } else {
      if (respData.code == -1001) {
        // 如果cookie过期,需要清除本地存储的登录信息
        // StorageManager.localStorage.deleteItem(UserModel.keyUser);
        throw const UnAuthorizedException(); // 需要登录
      } else {
        throw NotSuccessException.fromRespData(respData);
      }
    }
  }
}
