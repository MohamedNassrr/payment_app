import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:payments_app/core/utils/app_router.dart';
import 'package:payments_app/core/widgets/custom_button.dart';
import 'package:payments_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payments_app/features/checkout/presentation/controller/stripe_Payment_cubit/stripe_payment_cubit.dart';
import 'package:payments_app/features/checkout/presentation/controller/stripe_Payment_cubit/stripe_payment_states.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentStates>(
      listener: (context, state) {
        if (state is StripePaymentSuccessState) {
          GoRouter.of(context).pushReplacement(AppRouter.kThankYouView);
        }

        if (state is StripePaymentFailureState) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          log(state.errMessage.toString());
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: '100',
              currency: 'USD',
              customerId: 'cus_RkaUPqw9IYN8Bc',
            );
            BlocProvider.of<StripePaymentCubit>(context)
                .getPayment(paymentIntentInputModel: paymentIntentInputModel);
          },
          isLoading: state is StripePaymentLoadingState ? true : false,
          title: 'Continue',
        );
      },
    );
  }
}
