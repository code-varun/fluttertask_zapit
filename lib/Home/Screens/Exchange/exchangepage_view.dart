import 'package:flutter/material.dart';

class ExchangePage extends StatefulWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  final Function onScreenHideButtonPressed;
  const ExchangePage(
      {Key? key,
      required this.menuScreenContext,
      required this.hideStatus,
      required this.onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Exchange"),
    );
  }
}
