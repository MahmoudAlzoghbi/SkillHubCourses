import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(226,224,219, 0.8),
      child: Center(
       child: SpinKitFadingCube(
         color: Color.fromRGBO(225,161,60, 0.8),
         duration: Duration(seconds: 5),
       ),
      ),
    );
  }
}
