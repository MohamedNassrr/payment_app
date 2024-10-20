import 'package:flutter/material.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(),
      body: const ThankYouViewBody(),
    );
  }
}
