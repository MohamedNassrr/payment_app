abstract class StripePaymentStates {}

class StripePaymentInitialState extends StripePaymentStates {}

class StripePaymentLoadingState extends StripePaymentStates {}

class StripePaymentSuccessState extends StripePaymentStates {}

class StripePaymentFailureState extends StripePaymentStates {
  final String errMessage;

  StripePaymentFailureState(this.errMessage);
}
