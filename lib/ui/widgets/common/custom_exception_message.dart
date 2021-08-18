import 'package:diiket_core/diiket_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomExceptionMessage extends StatelessWidget {
  final Object exception;

  const CustomExceptionMessage(this.exception, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CustomException e = exception as CustomException;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: kReleaseMode
          ? Text(e.message ?? 'Terjadi kesalahan.')
          : Text(e.toString()),
    );
  }
}
