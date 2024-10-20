import 'package:flutter/material.dart';
import 'package:payments_app/core/utils/styles.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/payment_detail_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Payment Details',
          style: Styles.style25,
        ),
      ),
      body: const PaymentDetailBody(),
    );
  }
}
