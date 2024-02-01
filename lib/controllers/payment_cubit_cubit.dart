import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_e_wallet/controllers/payment_cubit_state.dart';
import 'package:insta_e_wallet/core/network/dio_healper.dart';
import 'package:insta_e_wallet/core/network/network_consts.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentAuthInitState());
  static PaymentCubit get(context) => BlocProvider.of(context);

  Future<String?> getAuthToken() async {
    emit(PaymentAuthLoading());
    await DioHelper.postData(
        url: ApiConstants.authTokenEndPoint,
        data: {'api_key': ApiConstants.apiKey}).then((value) {
      ApiConstants.returnedFirstToken = value.data['token'];
      emit(PaymentAuthSucsses());
      print(ApiConstants.returnedFirstToken);
    }).catchError((err) {
      print(err);
      emit(PaymentAuthError());
    });
  }

  Future getOrderId({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String totalPrice,
  }) async {
    emit(PaymentGetOrderIdLoadingState());
    DioHelper.postData(url: ApiConstants.orderIdEndPoint, data: {
      "auth_token": ApiConstants.returnedFirstToken,
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
      "shipping_data": {
        "apartment": "803",
        "email": "claudette09@exa.com",
        "floor": "42",
        "first_name": "Clifford",
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": "+86(8)9135210487",
        "postal_code": "01898",
        "extra_description": "8 Ram , 128 Giga",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name": "Nicolas",
        "state": "Utah"
      },
      "shipping_details": {
        "notes": " test",
        "number_of_packages": 1,
        "weight": 1,
        "weight_unit": "Kilogram",
        "length": 1,
        "width": 1,
        "height": 1,
        "contents": "product of some sorts"
      }
    }).then((value) {
      ApiConstants.returnedOrderId = value.data['id'];
      print(ApiConstants.returnedOrderId);
      // emit(PaymentGetOrderIdSuccsesState())
    }).catchError((error) {
      print(error);
    });
  }
}
