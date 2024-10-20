import 'package:flutter/material.dart';
import 'package:payments_app/core/utils/styles.dart';

class TotalPriceItem extends StatelessWidget {
  const TotalPriceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Total',
          style: Styles.style18,
          textAlign: TextAlign.center,
        ),
        Spacer(),
        Text(
          r'$50.97',
          style: Styles.style18,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
