import 'dart:io';

import 'package:crypto_app/GlobalModels/user_model.dart';
import 'package:crypto_app/GlobalModels/user_model_bloc/user_model_bloc.dart';
import 'package:crypto_app/Home/Screens/HomePage/floor_bloc/floor_database_bloc.dart';
import 'package:crypto_app/Home/Screens/Wallet/model/wallet_info_panels_data_holder_model.dart';
import 'package:crypto_app/Home/Screens/Wallet/view/wallet_info_panels_view.dart';
import 'package:crypto_app/Home/Screens/Wallet/view/wallet_transaction_model.dart';
import 'package:crypto_app/Home/Screens/Wallet/view/wallet_transaction_panel_view.dart';
import 'package:crypto_app/OtherScreens/Settings/Settingspage/view/settingpage_view.dart';
import 'package:crypto_app/Utils/custom_colors.dart';
import 'package:crypto_app/Utils/custom_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shimmer/shimmer.dart';

class WalletPage extends StatefulWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  final Function onScreenHideButtonPressed;
  const WalletPage(
      {Key? key,
      required this.menuScreenContext,
      required this.hideStatus,
      required this.onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List<WalletInfoPanelsDataHolder> infoPanels = [
    const WalletInfoPanelsDataHolder(
      icon: Icons.currency_bitcoin,
      name: "Bitcoin",
      amount: 3.123,
    ),
    const WalletInfoPanelsDataHolder(
      icon: Icons.currency_bitcoin,
      name: "Etherium",
      amount: 3.123,
    ),
    const WalletInfoPanelsDataHolder(
      icon: Icons.currency_bitcoin,
      name: "Etherium 2",
      amount: 3.123,
    ),
    const WalletInfoPanelsDataHolder(
      icon: Icons.currency_bitcoin,
      name: "Cinance",
      amount: 3.123,
    ),
  ];

  // late List<WalletInfoPanelsDataHolder> infoPanels;

  late bool _loadWallet;
  late bool _loadMarket;
  late bool _loadTransactions;
  late List<WalletTransactionPanel> transactionsInfoPanels = [];
  late String _balance;

  @override
  void initState() {
    _loadWallet = false;
    _loadMarket = false;
    _loadTransactions = false;

    findTrx(context.read<FloorDatabaseBloc>().state.props.first as AppDatabase);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loadWallet = true;
    _loadMarket = true;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              child: Row(
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
            ),
            Container(
              padding: const EdgeInsets.only(top: 25, bottom: 25),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: (_loadWallet == false)
                        ? Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Shimmer.fromColors(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 25),
                                  color: Colors.white,
                                  height: 15,
                                  width: 80,
                                ),
                                baseColor: Colors.grey.shade200,
                                highlightColor: Colors.grey.shade100),
                          )
                        : Container(
                            margin: const EdgeInsets.only(left: 25),
                            child: Text(
                              "Total Balance",
                              style: FontsCustom.titilliumWeb(
                                fontSize: 12,
                                fontColor: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 25),
                      child: (_loadWallet == false)
                          ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Shimmer.fromColors(
                                      child: Container(
                                        color: Colors.white,
                                        height: 25,
                                        width: 60,
                                      ),
                                      baseColor: Colors.grey.shade200,
                                      highlightColor: Colors.grey.shade100),
                                ),
                              ],
                            )
                          : BlocBuilder<UserModelBloc, UserModelState>(
                              builder: (context, state) {
                              return RichText(
                                text: TextSpan(
                                    text: "USD",
                                    style: FontsCustom.titilliumWeb(
                                      fontSize: 21,
                                      fontColor: ColorCustom.maastrichtBlue,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            "\$${(state.props.first as UserModel).balance}",
                                        style: FontsCustom.titilliumWeb(
                                          fontSize: 21,
                                          fontColor: ColorCustom.maastrichtBlue,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ]),
                              );
                            }),
                    ),
                  ),
                  (_loadMarket == false)
                      ? SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return WalletinfoPanelsShimmer(
                                index: index,
                                panelLength: 4,
                              );
                            },
                          ),
                        )
                      : SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: infoPanels.length,
                            itemBuilder: (context, index) {
                              return WalletinfoPanels(
                                index: index,
                                panelLength: infoPanels.length,
                                name: infoPanels[index].name,
                                icon: infoPanels[index].icon,
                                amount: infoPanels[index].amount,
                              );
                            },
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        WalletPanelIconAndTextButton(
                          icon: Icons.attach_money,
                          title: "Top Up",
                        ),
                        WalletPanelIconAndTextButton(
                          icon: Icons.send,
                          title: "Send",
                        ),
                        WalletPanelIconAndTextButton(
                          icon: Icons.request_page_outlined,
                          title: "Request",
                        ),
                        WalletPanelIconAndTextButton(
                          icon: Icons.qr_code_scanner_outlined,
                          title: "Scan QR",
                        ),
                        WalletPanelIconAndTextButton(
                          icon: Icons.more_vert_rounded,
                          title: "More",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text(
                        "Transactions",
                        style: FontsCustom.dmSans(
                            fontSize: 21,
                            fontColor: ColorCustom.maastrichtBlue,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  (_loadTransactions == false)
                      ? Column(
                          children: const [
                            WalletTransactionShimmerPanel(),
                            WalletTransactionShimmerPanel(),
                            WalletTransactionShimmerPanel(),
                            WalletTransactionShimmerPanel(),
                          ],
                        )
                      : Column(
                          children: transactionsInfoPanels,
                        ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> findTrx(AppDatabase db) async {
    db.walletTransactionModelDao.findAllWalletTransactions().then((value) {
      for (var element in value) {
        transactionsInfoPanels
            .add(WalletTransactionPanel(walletTransactionModel: element));
      }
      setState(() {
        _loadTransactions = true;
      });
    });
  }
}
