import 'package:flutter/material.dart';

class ChangeNotifierWidget extends StatefulWidget {
  final Widget Function(BuildContext) builder;
  final Listenable listenable;

  const ChangeNotifierWidget({
    required this.builder,
    required this.listenable,
    Key? key,
  }) : super(key: key);

  @override
  _ChangeNotifierWidgetState createState() => _ChangeNotifierWidgetState();
}

class _ChangeNotifierWidgetState extends State<ChangeNotifierWidget> {
  @override
  void initState() {
    widget.listenable.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
