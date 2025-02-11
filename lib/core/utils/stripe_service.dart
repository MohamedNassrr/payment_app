import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payments_app/core/utils/api_keys.dart';
import 'package:payments_app/core/utils/api_service.dart';
import 'package:payments_app/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:payments_app/features/checkout/data/models/init_payment_intent_input_model.dart';
import 'package:payments_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payments_app/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  // create payment intent
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      contentType: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  // initialization payment sheet
  Future initPaymentSheet(
      {required InitPaymentInputModel initPaymentInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentInputModel.clientSecret,
        merchantDisplayName: 'mohamed',
        customerId: initPaymentInputModel.customerId,
        customerEphemeralKeySecret: initPaymentInputModel.ephemeralKey,
      ),
    );
  }

  // display payment sheet
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentIntentInputModel = InitPaymentInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKey: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(initPaymentInputModel: initPaymentIntentInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        body: {
          'customer': customerId,
        },
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        header: {
          'Authorization': "bearer ${ApiKeys.secretKey}",
          'Stripe-Version': '2024-09-30.acacia',
        });
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKeyModel;
  }
}
