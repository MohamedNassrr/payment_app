import 'package:go_router/go_router.dart';
import 'package:payments_app/features/checkout/presentation/views/my_cart_view.dart';
import 'package:payments_app/features/checkout/presentation/views/payment_details.dart';
import 'package:payments_app/features/checkout/presentation/views/thank_you_view.dart';

abstract class AppRouter {

  static const kPaymentView = '/PaymentDetailsView';
  static const kThankYouView = '/ThankYouView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MyCartView(),
      ),
      GoRoute(
        path: kPaymentView,
        builder: (context, state) => const PaymentDetailsView(),
      ),
      GoRoute(
        path: kThankYouView,
        builder: (context, state) => const ThankYouView(),
      ),
    ],
  );
}
