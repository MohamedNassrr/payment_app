import 'package:dartz/dartz.dart';
import 'package:payments_app/core/errors/failures.dart';
import 'package:payments_app/core/utils/stripe_service.dart';
import 'package:payments_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payments_app/features/checkout/data/repos/check_out_repo.dart';

class CheckOutRepoImpl implements CheckOutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> fetchPayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );

      return right(null);
    } catch (e) {
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
