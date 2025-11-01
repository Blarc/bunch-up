import 'package:flutter/material.dart';

List<Shadow> textShadows({double blurRadius = 4}) {
  return [
    Shadow(
      offset: Offset(0, blurRadius == 8 ? 2 : 1),
      blurRadius: blurRadius,
      color: Colors.black54,
    ),
  ];
}
