class PaymobConsts {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String authTokenEndPoint = '/auth/tokens';
  static const String orderIdEndPoint = '/ecommerce/orders';
  static const String paymentIdEndPoint = '/acceptance/payment_keys';
  static const String kaioskRefCodeEndPoint = 'acceptance/payments/pay';
  static const String apiKey =
      'ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2libUZ0WlNJNkltbHVhWFJwWVd3aUxDSndjbTltYVd4bFgzQnJJam8zTVRZMk9EaDkuMExoREJtTWRlYlZLZlk2WmFvbW1zMVBwTXBSaUdBZHhpLUZrX0VLcGV4RWwxdnlESDd5cWkwT3Zsam5lTjI2OEtBS3lBRGpaQktudXZYaTlTNWRLRHc=';
  static String integrationIdKiosk = '4453629';
  static String integrationIdCart = '3522681';
  static String authToken = '';
  static String returnedOrderId = '';
  static String finalToken = '';
  static String visaUrl ='https://accept.paymob.com/api/acceptance/iframes/740607?payment_token={payment_key_obtained_previously}' ; 
}
