import 'package:flutter/material.dart';
import 'package:crypto_app/Utils/custom_colors.dart';
import 'package:crypto_app/Utils/custom_fonts.dart';
import 'package:shimmer/shimmer.dart';

class WalletinfoPanels extends StatelessWidget {
  final int index;
  final int panelLength;
  final IconData icon;
  final String name;
  final double amount;
  const WalletinfoPanels({
    Key? key,
    required this.index,
    required this.panelLength,
    required this.icon,
    required this.name,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      margin:
          EdgeInsets.only(left: 25, right: (index - 1 == panelLength) ? 25 : 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color:
              (index == 0) ? ColorCustom.brilliantAzura : Colors.grey.shade200),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Icon(
              icon,
              color: (index == 0) ? Colors.white : ColorCustom.maastrichtBlue,
            ),
          ),
          FittedBox(
            child: Text(
              name,
              style: FontsCustom.titilliumWeb(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                fontColor:
                    (index == 0) ? Colors.white : ColorCustom.maastrichtBlue,
              ),
            ),
          ),
          const Spacer(),
          FittedBox(
            child: Text(
              amount.toString(),
              style: FontsCustom.titilliumWeb(
                fontSize: 16,
                fontColor:
                    (index == 0) ? Colors.white : ColorCustom.maastrichtBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WalletinfoPanelsShimmer extends StatelessWidget {
  final int index;
  final int panelLength;
  const WalletinfoPanelsShimmer(
      {required this.index, required this.panelLength, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 100,
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: EdgeInsets.only(
            left: 25, right: (index == panelLength - 1) ? 25 : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
      ),
    );
  }
}
