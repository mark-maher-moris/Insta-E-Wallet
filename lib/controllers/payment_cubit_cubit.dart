import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_e_wallet/controllers/payment_cubit_state.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitState());
  static PaymentCubit get(context) => BlocProvider.of(context);
}
