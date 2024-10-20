import 'package:flutter/material.dart';

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
          Container(
            decoration: ShapeDecoration(
              color: const Color(0xffD9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * 0.2 + 10,
            left: 20 + 3,
            right: 20 + 3,
            child: Row(
              children: List.generate(
                  35,
                  (index) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Container(
                        color: const Color(0xffB8B8B8),
                        height: 2,
                      ),
                    ),
                  ),
              ),
            ),
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
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 50,
              backgroundColor:  Color(0xffD9D9D9),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xff34A853),
                child: Icon(
                  Icons.check,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
