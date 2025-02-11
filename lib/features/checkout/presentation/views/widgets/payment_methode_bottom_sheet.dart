import 'package:flutter/material.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/payment_method_list_view.dart';

class PaymentMethodeBottomSheet extends StatelessWidget {
  const PaymentMethodeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentMethodListView(),
          SizedBox(
            height: 32,
          ),
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}
