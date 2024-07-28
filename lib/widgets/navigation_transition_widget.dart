import 'package:flutter/material.dart';

class NavigationTransitionWidget extends StatefulWidget {
  const NavigationTransitionWidget({
    super.key,
    required this.scaffoldKey,
    required this.appBar,
    required this.body,
    required this.navigationBar,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final PreferredSizeWidget appBar;
  final Widget body;
  final Widget navigationBar;

  @override
  State<NavigationTransitionWidget> createState() => _NavigationTransitionWidgetState();
}

class _NavigationTransitionWidgetState extends State<NavigationTransitionWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: widget.appBar,
      body: widget.body,
      bottomNavigationBar: widget.navigationBar,
    );
  }
}
