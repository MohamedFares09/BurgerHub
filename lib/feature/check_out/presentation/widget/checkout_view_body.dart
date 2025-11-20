import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_styles.dart';
import 'package:hungry_app/feature/check_out/presentation/widget/order_summary_row.dart';
import 'package:hungry_app/feature/check_out/presentation/widget/select_payment.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  String selectedPayment = 'cash';
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Summary', style: AppStyles.semibold20),
          SizedBox(height: 10),
          OrderSummaryRow(name: "Order", price: 16.48),
          OrderSummaryRow(name: "Taxes", price: 0.3),
          OrderSummaryRow(name: "Delivery fees", price: 1.5),
          Divider(),
          SizedBox(height: 24.5),
          OrderSummaryRow(
            name: "Total",
            price: 18.73,
            style: AppStyles.regular18.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text('Estimated delivery time:', style: AppStyles.semibold14),
                Spacer(),
                Text('15 - 30 mins', style: AppStyles.semibold14),
              ],
            ),
          ),
          SizedBox(height: 60),
          Text('Payment Method', style: AppStyles.semibold20),
          SizedBox(height: 20),
          SelectPayment(
            onTap: () => setState(() => selectedPayment = 'cash'),
            title: 'Cash on Delivery',
            image: 'assets/images/cash.png',
            color: Colors.white,
            value: 'cash',
            groupValue: selectedPayment,
            onChanged: (value) {
              setState(() => selectedPayment = value!);
            },
          ),
          SizedBox(height: 25),
          SelectPayment(
            onTap: () => setState(() => selectedPayment = 'visa'),
            titleStyle: AppStyles.mediam18.copyWith(color: Colors.white),
            tileColor: Colors.black,
            title: 'Debit card',
            subTitle: Text(
              '3566 **** **** 0505',
              style: AppStyles.mediam18.copyWith(color: Colors.white),
            ),
            image: 'assets/images/visa.png',
            color: Colors.white,
            value: 'visa',
            groupValue: selectedPayment,
            onChanged: (value) {
              setState(() => selectedPayment = value!);
            },
          ),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: isChecked,
                onChanged: (v) {
                  setState(() {
                    isChecked = v!;
                  });
                },
              ),
              SizedBox(width: 3),
              Text(
                'Save card details for future payments',
                style: AppStyles.regular16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
