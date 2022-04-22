import 'package:flutter/material.dart';

class ErrorUI extends StatelessWidget {
  final String? errorMsg;
  const ErrorUI({Key? key, this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMsg ?? "Oops, Something went wrong"),
    );
  }
}
