import 'package:bloc/bloc.dart';
import 'package:payments_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payments_app/features/checkout/data/repos/check_out_repo.dart';
import 'package:payments_app/features/checkout/presentation/controller/stripe_Payment_cubit/stripe_payment_states.dart';

class StripePaymentCubit extends Cubit<StripePaymentStates> {
  StripePaymentCubit(this.checkOutRepo) : super(StripePaymentInitialState());

  final CheckOutRepo checkOutRepo;

  Future getPayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymentLoadingState());
    var data = await checkOutRepo.fetchPayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold((failure) {
      emit(StripePaymentFailureState(failure.errMessage));
    }, (success) {
      emit(StripePaymentSuccessState());
    });
  }
}
