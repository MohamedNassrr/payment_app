import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payments_app/core/utils/app_router.dart';
import 'package:payments_app/core/widgets/custom_button.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/custom_credit_card.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/payment_method_list_view.dart';

class PaymentDetailBody extends StatefulWidget {
  const PaymentDetailBody({super.key});

  @override
  State<PaymentDetailBody> createState() => _PaymentDetailBodyState();
}

class _PaymentDetailBodyState extends State<PaymentDetailBody> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodListView(),
        ),
        const SliverToBoxAdapter(
          child: CustomCreditCard(),
        ),
        SliverFillRemaining(
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 12,
                left: 16,
                right: 16,
              ),
              child: CustomButton(
                title: 'Pay',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kThankYouView);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
