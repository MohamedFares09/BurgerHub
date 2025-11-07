import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class QuantityControlRow extends StatefulWidget {
  const QuantityControlRow({super.key});

  @override
  State<QuantityControlRow> createState() => _QuantityControlRowState();
}

class _QuantityControlRowState extends State<QuantityControlRow> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (counter > 0) {
                counter--;
              }
            });
          },
          child: _QuantityButton(icon: Icons.remove),
        ),
        //  const SizedBox(width: 30),
        Padding(
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: Text(
            '$counter',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        //  const SizedBox(width: 30),
        GestureDetector(
          onTap: () {
            setState(() {
              counter++;
            });
          },
          child: _QuantityButton(icon: Icons.add),
        ),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  const _QuantityButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.white, size: 22),
    );
  }
}
