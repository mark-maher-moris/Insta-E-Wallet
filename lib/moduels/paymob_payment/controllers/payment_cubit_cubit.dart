import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_e_wallet/moduels/paymob_payment/controllers/payment_cubit_state.dart';
import 'package:insta_e_wallet/core/network/dio_healper.dart';
import 'package:insta_e_wallet/moduels/paymob_payment/paymob_consts.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentAuthInitState());
  static PaymentCubit get(context) => BlocProvider.of(context);

  Future<String?> getAuthToken() async {
    emit(PaymentAuthLoading());
    await DioHelper.postData(
        url: PaymobConsts.authTokenEndPoint,
        data: {'api_key': PaymobConsts.apiKey}).then((value) {
      PaymobConsts.authToken = value.data['token'];
      emit(PaymentAuthSucsses());
      print(PaymobConsts.authToken);
    }).catchError((err) {
      print(err);
      emit(PaymentAuthError());
    });
  }

  Future getOrderId({
    required String firstName,
    required String email,
    required String phoneNumber,
    required String totalPrice,
  }) async {
    emit(PaymentGetOrderIdLoadingState());
    DioHelper.postData(url: PaymobConsts.orderIdEndPoint, data: {
      "auth_token": PaymobConsts.authToken,
      "delivery_needed": "false",
      "amount_cents": "100",
      "currency": "EGP",
      // "merchant_order_id": 5,
      "items": [
        {
          "name": "ASC1515",
          "amount_cents": "500000",
          "description": "Smart Watch",
          "quantity": "1"
        },
      ],
    }).then((value) {
      PaymobConsts.returnedOrderId = value.data['id'];
      getPaymentToken(
          firstName: firstName,
          email: email,
          phoneNumber: phoneNumber,
          totalPrice: totalPrice);
      print(PaymobConsts.returnedOrderId);
      // emit(PaymentGetOrderIdSuccsesState())
    }).catchError((error) {
      print(error);
    });
  }

  Future<String?> getPaymentToken({
    required String firstName,
    required String email,
    required String phoneNumber,
    required String totalPrice,
  }) async {
    await DioHelper.postData(url: PaymobConsts.paymentIdEndPoint, data: {
      "auth_token": PaymobConsts.authToken,
      "amount_cents": totalPrice,
      "expiration": 3600,
      "order_id": PaymobConsts.returnedOrderId,
      "currency": "EGP",
      "integration_id": PaymobConsts.integrationIdKiosk,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phoneNumber,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": "Na",
        "state": "NA"
      },
    }).then((value) {
      PaymobConsts.finalToken = value.data['token'];
      print(PaymobConsts.finalToken);
    }).catchError((err) {
      print(err);
    });
  }

  Future<String?> getKioskRefCode() async {
    DioHelper.postData(url: PaymobConsts.kaioskRefCodeEndPoint, data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": PaymobConsts.finalToken
    }).then((value) {
      String kioskRefCode = value.data['id'].toString();
      return kioskRefCode;
    }).catchError((err) {
      print(err);
    });
  }

}
