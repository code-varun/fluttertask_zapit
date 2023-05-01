import 'package:crypto_app/Home/Screens/HomePage/MarketCoinPanel/market_coin_model.dart';
import 'package:crypto_app/Utils/custom_colors.dart';
import 'package:crypto_app/Utils/custom_fonts.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MarketCoinStatusPanel extends StatefulWidget {
  MarketCoinModel marketCoinModel;

  MarketCoinStatusPanel({
    required this.marketCoinModel,
    Key? key,
  }) : super(key: key);
  @override
  State<MarketCoinStatusPanel> createState() => _MarketCoinStatusPanelState();
}

class _MarketCoinStatusPanelState extends State<MarketCoinStatusPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 5,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: (widget.marketCoinModel.priceChange24H == null)
            ? Colors.grey.withAlpha(50)
            : (widget.marketCoinModel.priceChange24H! >= 0)
                ? Colors.lightGreen.withAlpha(50)
                : Colors.red.withAlpha(50),
        border: Border.all(
          color: ColorCustom.maastrichtBlue.withAlpha(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const FlutterLogo(),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.marketCoinModel.name,
                    overflow: TextOverflow.ellipsis,
                    style: FontsCustom.dmSans(
                      fontSize: 18,
                      fontColor: ColorCustom.maastrichtBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.marketCoinModel.symbol,
                    style: FontsCustom.dmSans(
                      fontSize: 14,
                      fontColor: ColorCustom.maastrichtBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  (widget.marketCoinModel.currentPrice == null)
                      ? "${0.00}\$"
                      : "${widget.marketCoinModel.currentPrice.toString()}\$",
                  style: FontsCustom.dmSans(
                    fontSize: 18,
                    fontColor: ColorCustom.maastrichtBlue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      (widget.marketCoinModel.priceChange24H == null)
                          ? null
                          : (widget.marketCoinModel.priceChange24H! >= 0)
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                      color: (widget.marketCoinModel.priceChange24H == null)
                          ? null
                          : (widget.marketCoinModel.priceChange24H! >= 0)
                              ? Colors.lightGreen
                              : Colors.red,
                    ),
                    Text(
                      (widget.marketCoinModel.priceChange24H == null)
                          ? "${0.00}\$"
                          : "${widget.marketCoinModel.priceChange24H.toString()}\$",
                      style: FontsCustom.dmSans(
                        fontSize: 12,
                        fontColor:
                            (widget.marketCoinModel.priceChange24H == null)
                                ? null
                                : (widget.marketCoinModel.priceChange24H! >= 0)
                                    ? Colors.lightGreen
                                    : Colors.red,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MarketCoinStatusShimmerPanel extends StatefulWidget {
  const MarketCoinStatusShimmerPanel({Key? key}) : super(key: key);

  @override
  State<MarketCoinStatusShimmerPanel> createState() =>
      _MarketCoinStatusShimmerPanelState();
}

class _MarketCoinStatusShimmerPanelState
    extends State<MarketCoinStatusShimmerPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 5,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade100,
                // enabled: _enabled,
                child: Container(
                  color: Colors.white,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade100,
                    // enabled: _enabled,
                    child: Container(
                      color: Colors.white,
                      height: 15,
                      width: 70,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade100,
                    // enabled: _enabled,
                    child: Container(
                      color: Colors.white,
                      height: 15,
                      width: 60,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade100,
                    // enabled: _enabled,
                    child: Container(
                      color: Colors.white,
                      height: 20,
                      width: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade100,
                    // enabled: _enabled,
                    child: Container(
                      color: Colors.white,
                      height: 10,
                      width: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
