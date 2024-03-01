import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String? buttonTitle;
  final Function? onclick;

  const CustomButton({required this.buttonTitle, required this.onclick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onclick!(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.primaryColor,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Constants.greyColor, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        maximumSize: Size(MediaQuery.of(context).size.width * 0.9, 53),
      ),
      child: Center(
          child: Text(
        buttonTitle!,
        style: const TextStyle(color: Constants.whiteColor, fontWeight: FontWeight.bold),
      )),
    );
  }
}
