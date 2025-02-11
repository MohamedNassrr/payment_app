import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payments_app/core/utils/app_router.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.kMayCartView);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: const ThankYouViewBody(),
    );
  }
}
