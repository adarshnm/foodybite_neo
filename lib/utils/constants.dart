import 'dart:ui';

import 'package:flutter/material.dart';

const Color neo_bg = Color(0x0FFE0E5EC);
const Color neo_bg_dark_shadow = Color(0xAFA3B1C6);
const Color primaryBlue = Color(0xFF5663FF);
const Color inactive_color = Color(0xFF6E7FAA);
const Color button_color = Color(0xFFB6BED4);
const Color text_color = Color(0xFF8A98BA);
const String userKey = '29f1d4ee0b3770e3a150b3c517c0ed93';

const neoDecoration = BoxDecoration(
  color: neo_bg,
  borderRadius: const BorderRadius.all(Radius.circular(8)),
  boxShadow: [
    BoxShadow(color: neo_bg_dark_shadow, offset: Offset(4, 4), blurRadius: 12),
    BoxShadow(color: Colors.white, offset: Offset(-4, -4), blurRadius: 12),
  ],
);
