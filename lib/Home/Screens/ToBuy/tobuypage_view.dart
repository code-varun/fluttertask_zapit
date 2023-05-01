import 'package:flutter/material.dart';

class ToBuyPage extends StatefulWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  final Function onScreenHideButtonPressed;
  const ToBuyPage(
      {Key? key,
      required this.menuScreenContext,
      required this.hideStatus,
      required this.onScreenHideButtonPressed})
      : super(key: key);

  @override
  State<ToBuyPage> createState() => _ToBuyPageState();
}

class _ToBuyPageState extends State<ToBuyPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("To Buy"),
    );
  }
}
