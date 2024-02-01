// part of 'payment_cubit_cubit.dart';

abstract class PaymentStates {}

class PaymentAuthInitState extends PaymentStates {}

class PaymentAuthSucsses extends PaymentStates {}
class PaymentAuthLoading extends PaymentStates {}
class PaymentAuthError extends PaymentStates{}

class PaymentGetOrderIdLoadingState extends PaymentStates{}
class PaymentGetOrderIdErrorState extends PaymentStates{}