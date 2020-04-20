import 'package:flutter/material.dart';
import 'package:foodybite_neo/utils/constants.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      margin: EdgeInsets.all(16),
      height: 60,
      decoration: neoDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: ImageIcon(
              AssetImage(
                'assets/images/search.png',
              ),
              color: button_color,
            ),
          ),
          Flexible(
            flex: 4,
            child: TextField(
              style: TextStyle(color: text_color),
              decoration: InputDecoration.collapsed(
                  hintText: 'Find Restaurant',
                  hintStyle: TextStyle(color: text_color)),
            ),
          ),
          Flexible(
            flex: 1,
            child: ImageIcon(
              AssetImage(
                'assets/images/filter.png',
              ),
              color: button_color,
            ),
          )
        ],
      ),
    );
  }
}
