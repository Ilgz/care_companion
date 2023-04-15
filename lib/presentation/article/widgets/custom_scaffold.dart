import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget body;
  final Widget? floatingActionButton;
  final bool isScrolling;
  final BottomNavigationBar? bottomNavigationBar;
  final List<Widget> actions;

  const CustomScaffold({
    Key? key,
    required this.body,
    this.floatingActionButton,
    this.padding,
    this.bottomNavigationBar,
    this.actions = const [],
    this.isScrolling = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16.0).copyWith(bottom: 0),
            child: isScrolling
                ? SingleChildScrollView(
                    child: body,
                  )
                : body,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
