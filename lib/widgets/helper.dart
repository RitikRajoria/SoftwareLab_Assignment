import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(
    BuildContext context, message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("$message"),
    ),
  );
}
