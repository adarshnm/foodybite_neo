import 'package:flutter/material.dart';
import 'package:foodybite_neo/utils/constants.dart';

class NeoButton extends StatelessWidget {
  const NeoButton({Key key, this.child, this.onTap}) : super(key: key);
  final child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: neo_bg,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: neo_bg_dark_shadow, offset: Offset(8, 6), blurRadius: 12),
          BoxShadow(
              color: Colors.white, offset: Offset(-8, -6), blurRadius: 12),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}

class NeoButtonInner extends StatelessWidget {
  const NeoButtonInner({Key key, this.child, this.onTap}) : super(key: key);
  final child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: neo_bg,
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.9],
            colors: [neo_bg_dark_shadow, Colors.white]),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
