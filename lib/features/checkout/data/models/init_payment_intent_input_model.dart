class InitPaymentInputModel{
  final String clientSecret;
  final String customerId;
  final String ephemeralKey;

  InitPaymentInputModel({required this.clientSecret, required this.customerId, required this.ephemeralKey});
}