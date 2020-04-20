import 'package:flutter/material.dart';
import 'package:foodybite_neo/utils/constants.dart';

class FoodyBiteHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onsubTitleTap;
  final EdgeInsetsGeometry padding;
  FoodyBiteHeader(
      {Key key,
      @required this.title,
      @required this.subTitle,
      @required this.onsubTitleTap,
      EdgeInsetsGeometry padding})
      :assert(title!=null),
      padding = padding ?? EdgeInsets.all(8),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          GestureDetector(
            child: Text(
              subTitle,
              style: TextStyle(color: text_color),
            ),
            onTap: onsubTitleTap,
          )
        ],
      ),
    );
  }
}
