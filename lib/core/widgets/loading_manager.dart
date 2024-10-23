import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingManager extends StatelessWidget {
  const LoadingManager(
      {super.key, required this.isloading, required this.child});
  final bool isloading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        isloading
            ? Container(
                color: Colors.black.withOpacity(0.6),
              )
            : Container(),
        isloading
            ? const Center(
                child: SpinKitFadingCube(
                  color: Colors.white,
                  size: 45,
                ),
              )
            : Container()
      ],
    );
  }
}
