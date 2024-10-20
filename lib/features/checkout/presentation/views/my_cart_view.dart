import 'package:flutter/material.dart';
import 'package:payments_app/core/utils/styles.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: Styles.style25,
        ),
      ),
      body: const MyCartViewBody(),
    );
  }
}
