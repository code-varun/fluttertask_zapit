import 'package:flutter/material.dart';
import 'package:crypto_app/Utils/custom_colors.dart';
import 'package:crypto_app/Utils/custom_fonts.dart';

class CustomElevatedStadiumButton extends StatefulWidget {
  final Function? func;
  final String buttonText;
  const CustomElevatedStadiumButton(
      {required this.func, required this.buttonText, Key? key})
      : super(key: key);

  @override
  State<CustomElevatedStadiumButton> createState() =>
      _CustomElevatedStadiumButtonState();
}

class _CustomElevatedStadiumButtonState
    extends State<CustomElevatedStadiumButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: ColorCustom.brilliantAzura,
              padding: const EdgeInsets.symmetric(vertical: 8),
              shape: const StadiumBorder(),
              elevation: 0),
          onPressed: () {
            widget.func!();
          },
          child: Center(
            child: Text(
              widget.buttonText,
              style: FontsCustom.dmSans(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
