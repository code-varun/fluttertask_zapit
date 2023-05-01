import 'package:crypto_app/Home/Screens/Wallet/view/wallet_transaction_model.dart';
import 'package:crypto_app/Utils/custom_colors.dart';
import 'package:crypto_app/Utils/custom_fonts.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WalletTransactionPanel extends StatelessWidget {
  final WalletTransactionModel walletTransactionModel;
  const WalletTransactionPanel({
    Key? key,
    required this.walletTransactionModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipOval(
        child: Container(
          color: (walletTransactionModel.amount >= 0)
              ? Colors.lightGreen
              : Colors.red,
          padding: const EdgeInsets.all(8),
          child: Icon(
            (walletTransactionModel.amount >= 0)
                ? Icons.south_west_rounded
                : Icons.north_east_rounded,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        walletTransactionModel.title,
        style: FontsCustom.dmSans(
          fontSize: 12,
          fontColor: ColorCustom.maastrichtBlue,
          fontWeight: FontWeight.w800,
        ),
      ),
      subtitle: Text(
        walletTransactionModel.subTitle,
        style: FontsCustom.titilliumWeb(
          fontSize: 12,
          fontColor: ColorCustom.maastrichtBlue,
          fontWeight: FontWeight.w800,
        ),
      ),
      trailing: Text(
        (walletTransactionModel.amount >= 0)
            ? "+" " " "USD" " " + walletTransactionModel.amount.toString()
            : "-" " " "USD" " " +
                walletTransactionModel.amount.toString().substring(
                      1,
                      walletTransactionModel.amount.toString().length,
                    ),
        style: FontsCustom.titilliumWeb(
          fontSize: 12,
          fontColor: ColorCustom.maastrichtBlue,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class WalletPanelIconAndTextButton extends StatefulWidget {
  final IconData icon;
  final String title;
  const WalletPanelIconAndTextButton({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  State<WalletPanelIconAndTextButton> createState() =>
      _WalletPanelIconAndTextButtonState();
}

class _WalletPanelIconAndTextButtonState
    extends State<WalletPanelIconAndTextButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: Colors.grey.shade200,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              widget.icon,
              color: ColorCustom.maastrichtBlue,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          widget.title,
          style: FontsCustom.dmSans(
            fontSize: 12,
            fontColor: ColorCustom.maastrichtBlue,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class WalletTransactionShimmerPanel extends StatelessWidget {
  const WalletTransactionShimmerPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade100,
          child: Container(
            color: Colors.white,
            height: 25,
            width: 25,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 50,
            height: 15,
            color: Colors.white,
          ),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 100,
            height: 15,
            color: Colors.white,
          ),
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 20,
            height: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
