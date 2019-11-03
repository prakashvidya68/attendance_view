import 'package:flutter/material.dart';

class Attn {
  final Map<String,List<int>> atten;
  final int subNumber;

  const Attn({
    @required this.atten,
    @required this.subNumber,
  });
}