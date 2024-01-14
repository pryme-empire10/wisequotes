import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResponsiveLayout extends StatelessWidget {
  Widget mobileScaffold;
  Widget tabletScaffold;
  Widget deskScaffold;

  ResponsiveLayout({
    super.key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.deskScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return mobileScaffold;
              } else if (constraints.maxWidth < 1100) {
                return tabletScaffold;
              } else {
                return deskScaffold;
              }
            },
          );
        } else {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxHeight < 600) {
                return mobileScaffold;
              } else if (constraints.maxHeight < 1100) {
                return tabletScaffold;
              } else {
                return deskScaffold;
              }
            },
          );
        }
      },
    );
  }
}
