import 'package:flutter/material.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/custom_checked_icon.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/custom_dashed_line.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/thank_you_card.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 20,
        right: 20,
        bottom: 20
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2 + 10,
            left: 20 + 3,
            right: 20 + 3,
            child: const CustomDashedLine(),
          ),
          Positioned(
            left: -20,
            height: MediaQuery.sizeOf(context).height * 1.2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: -20,
            height: MediaQuery.sizeOf(context).height * 1.2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const CustomCheckedIcon(),
        ],
      ),
    );
  }
}

