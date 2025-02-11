import 'package:dartz/dartz.dart';
import 'package:payments_app/core/errors/failures.dart';
import 'package:payments_app/features/checkout/data/models/payment_intent_input_model.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> fetchPayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
