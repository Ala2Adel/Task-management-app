import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? buttonTitle;
  final Function? onclick;

  const CustomButton({required this.buttonTitle, required this.onclick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onclick!(),
      child: Container(
        height: 53,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.green,
        ),
        child: Center(
            child: Text(
          buttonTitle!,
          style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
