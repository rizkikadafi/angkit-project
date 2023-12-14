import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Widget? body;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Color? foregroundColor;
  final double? topMarginBody;

  const CustomScaffold(
      {super.key,
      this.body,
      this.title,
      this.actions,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.bottomNavigationBar,
      this.foregroundColor,
      this.topMarginBody});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: widget.title,
                foregroundColor: widget.foregroundColor,
                actions: widget.actions,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: widget.topMarginBody ?? 150),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: widget.body,
            ),
          ),
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
