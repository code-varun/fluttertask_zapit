import 'dart:io';

import 'package:crypto_app/Crypto/coin_list_model.dart';
import 'package:crypto_app/GlobalModels/user_model.dart';
import 'package:crypto_app/GlobalModels/user_model_bloc/user_model_bloc.dart';
import 'package:crypto_app/Home/Screens/HomePage/MarketCoinPanel/market_coin_model.dart';
import 'package:crypto_app/Home/Screens/HomePage/MarketCoinPanel/market_coin_status.dart';
import 'package:crypto_app/OtherScreens/Settings/Settingspage/view/settingpage_view.dart';
import 'package:crypto_app/Utils/custom_colors.dart';
import 'package:crypto_app/Utils/custom_fonts.dart';
import 'package:crypto_app/Utils/database.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  final Function onScreenHideButtonPressed;
  const HomePage(
      {Key? key,
      required this.menuScreenContext,
      required this.hideStatus,
      required this.onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ClickableInfoPanelsDataHolder> infoPanels = [
    const ClickableInfoPanelsDataHolder(
        icon: Icons.library_books,
        color: ColorCustom.brilliantAzura,
        text: "Learn Crypto\nEarn Crypto"),
    const ClickableInfoPanelsDataHolder(
        icon: Icons.library_books,
        color: ColorCustom.greyShade200,
        text: "Learn Crypto\nEarn Crypto"),
    const ClickableInfoPanelsDataHolder(
        icon: Icons.library_books,
        color: ColorCustom.greyShade200,
        text: "Learn Crypto\nEarn Crypto"),
    const ClickableInfoPanelsDataHolder(
        icon: Icons.library_books,
        color: ColorCustom.greyShade200,
        text: "About Crypto"),
  ];
  late bool _loadWallet;
  late bool _loadMarket;
  late List<MarketCoinStatusPanel> marketCoinStatusList = [];
  final userbloc = UserModelBloc.instance;
  final dio = Dio();

  @override
  void initState() {
    _loadWallet = false;
    _loadMarket = false;
    fetchCoinList();
    loadWallet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorCustom.backgroundShade,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text("Exit"),
                              content: const Text("Are you sure?"),
                              actions: [
                                TextButton(
                                  child: const Text('No'),
                                  onPressed: () {
                                    Navigator.pop(widget.menuScreenContext);
                                  },
                                ),
                                TextButton(
                                  child: const Text('Yes'),
                                  onPressed: () {
                                    exit(0);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      pushNewScreen(context,
                          screen: const SettingsPage(), withNavBar: false);
                    },
                    icon: const Icon(Icons.settings)),
              ],
            ),
            (_loadWallet == false)
                ? walletShimmer()
                : Container(
                    margin: const EdgeInsets.all(25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: ColorCustom.brilliantAzura,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Wallet",
                            style: FontsCustom.titilliumWeb(
                                fontSize: 16,
                                fontColor: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Balance",
                            style: FontsCustom.titilliumWeb(
                                fontSize: 16,
                                fontColor: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w400),
                          ),
                          BlocBuilder<UserModelBloc, UserModelState>(
                              builder: (context, state) {
                            return Text(
                              "\$${(state.props.first as UserModel).balance}",
                              style: FontsCustom.titilliumWeb(
                                  fontSize: 32,
                                  fontColor: Colors.white,
                                  fontWeight: FontWeight.w800),
                            );
                          }),
                          Text(
                            "/USD",
                            style: FontsCustom.titilliumWeb(
                                fontSize: 16,
                                fontColor: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.money,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Deposite',
                                  style: FontsCustom.titilliumWeb(
                                      fontSize: 12,
                                      fontColor: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.account_balance_wallet,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Withdrew',
                                  style: FontsCustom.titilliumWeb(
                                      fontSize: 12,
                                      fontColor: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.dashboard_customize,
                                  size: 18,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'More',
                                  style: FontsCustom.titilliumWeb(
                                      fontSize: 12,
                                      fontColor: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 20, bottom: 10),
              child: Text(
                "For You",
                style: FontsCustom.dmSans(
                    fontSize: 21,
                    fontColor: ColorCustom.maastrichtBlue,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: infoPanels.length,
                itemBuilder: (context, index) {
                  return ClickableInfoPanels(
                    index: index,
                    panelPength: infoPanels.length,
                    color: infoPanels[index].color,
                    content: infoPanels[index].text,
                    icon: infoPanels[index].icon,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 20,
              ),
              child: Text(
                "Market",
                style: FontsCustom.dmSans(
                    fontSize: 21,
                    fontColor: ColorCustom.maastrichtBlue,
                    fontWeight: FontWeight.bold),
              ),
            ),
            (_loadMarket == false)
                ? Column(
                    children: const [
                      MarketCoinStatusShimmerPanel(),
                      MarketCoinStatusShimmerPanel(),
                      MarketCoinStatusShimmerPanel(),
                      MarketCoinStatusShimmerPanel(),
                    ],
                  )
                : Column(children: marketCoinStatusList),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }

  Widget walletShimmer() {
    return Container(
      margin: const EdgeInsets.all(25),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Colors.white,
                  height: 25,
                  width: 60,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Colors.white,
                  height: 30,
                  width: 80,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Colors.white,
                  height: 20,
                  width: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Colors.white,
                  height: 25,
                  width: 60,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      color: Colors.white,
                      height: 25,
                      width: 60,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      color: Colors.white,
                      height: 25,
                      width: 60,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      color: Colors.white,
                      height: 25,
                      width: 60,
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

  Future<void> fetchCoinList() async {
    final response = await dio.get<String>(
        'https://api.coingecko.com/api/v3/coins/list?include_platform=false');

    if (response.statusCode == 200) {
      coinListModelDatabase = cryptoListModelFromJson(response.data.toString());

      int count = 0;
      for (var coin in coinListModelDatabase) {
        count++;
        if (count == 15) {
          break;
        }
        final coinResponse = await dio.get<String>(
            'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=${coin.id}&order=market_cap_desc&per_page=20&page=1&sparkline=false');
        if (coinResponse.statusCode == 200) {
          var coinModel = marketCoinModelFromJson(coinResponse.data.toString());
          marketCoinModelDatabase.add(coinModel[0]);
          marketCoinStatusList.add(MarketCoinStatusPanel(
            marketCoinModel: coinModel[0],
          ));
          setState(() {
            _loadMarket = true;
          });
        }
        try {} catch (e) {}
      }
    }
  }

  Future loadWallet() async {
    await Future.delayed(Duration(seconds: 1)).whenComplete(() {
      setState(() {
        _loadWallet = true;
      });
    });
  }
}

class ClickableInfoPanelsDataHolder {
  final Color color;
  final String text;
  final IconData icon;
  const ClickableInfoPanelsDataHolder(
      {required this.color, required this.text, required this.icon});
}

class ClickableInfoPanels extends StatefulWidget {
  final Color color;
  final int index;
  final int panelPength;
  final String content;
  final IconData icon;
  const ClickableInfoPanels({
    Key? key,
    required this.color,
    required this.index,
    required this.panelPength,
    required this.content,
    required this.icon,
  }) : super(key: key);

  @override
  State<ClickableInfoPanels> createState() => _ClickableInfoPanelsState();
}

class _ClickableInfoPanelsState extends State<ClickableInfoPanels> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        margin: EdgeInsets.only(
            left: 25, right: (widget.index == widget.panelPength - 1) ? 25 : 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: widget.color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              color: (widget.index == 0)
                  ? Colors.white
                  : ColorCustom.brilliantAzura,
            ),
            const Spacer(),
            Text(
              widget.content,
              style: FontsCustom.titilliumWeb(
                fontSize: 12,
                fontColor: (widget.index == 0) ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
