import 'package:flutter/material.dart';
import 'package:foodybite_neo/utils/constants.dart';

class CuisineCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final Gradient gradient;

  const CuisineCard({Key key, this.imgUrl, this.title, this.gradient})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
              color: neo_bg_dark_shadow, offset: Offset(4, 4), blurRadius: 12),
          BoxShadow(
              color: Colors.white, offset: Offset(-4, -4), blurRadius: 12),
        ],
        image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              gradient: gradient,
            ),
          ),
          Align(
              child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ))
        ],
      ),
    );
  }
}
