import 'package:dio/dio.dart';
import 'package:insta_e_wallet/core/network/network_consts.dart';

class DioHelper {
  static late Dio dio;
  static initDio() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {'Content-Type': 'aplication/json'},
        receiveDataWhenStatusError: true));
  }

  static Future<Response> postData(
      {required String url, Map<String, dynamic>? data}) async {
    return await dio.post(url, data: data);
  }
}
