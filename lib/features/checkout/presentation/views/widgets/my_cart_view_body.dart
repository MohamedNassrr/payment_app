import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payments_app/core/utils/app_router.dart';
import 'package:payments_app/core/utils/assets_data.dart';
import 'package:payments_app/core/widgets/custom_button.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:payments_app/features/checkout/presentation/views/widgets/total_price_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset(AssetsData.basketImage)),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'$42.97',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'$0',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'$8',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              height: 34,
              thickness: 2,
              color: Color(0xffC7C7C7),
            ),
          ),
          const TotalPriceItem(),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            title: 'Complete Payment',
            onPressed: () {
              GoRouter.of(context).push(
                AppRouter.kPaymentView,
              );
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
