import 'package:dio/dio.dart';
import 'package:insta_e_wallet/moduels/paymob_payment/paymob_consts.dart';

class DioHelper {
  static late Dio dio;
  static initDio() {
    dio = Dio(BaseOptions(
        baseUrl: PaymobConsts.baseUrl,
        headers: {'Content-Type': 'application/json'},
        receiveDataWhenStatusError: true));
  }

  static Future<Response> postData(
      {required String url, Map<String, dynamic>? data}) async {
    return await dio.post(url, data: data);
  }
}
