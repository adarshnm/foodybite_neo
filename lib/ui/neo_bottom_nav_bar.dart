import 'dart:math';

import 'package:flutter/material.dart';

import 'package:foodybite_neo/utils/constants.dart';

class NeoBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color backgroundColor;
  final List<BottomNavigationBarItem> items;

  const NeoBottomNavigationBar(
      {Key key,
      this.currentIndex = 0,
      this.onTap,
      this.backgroundColor = neo_bg,
      @required this.items})
      : assert(items != null, 'Items should not be null'),
        super(key: key);

  @override
  _NeoBottomNavigationBarState createState() => _NeoBottomNavigationBarState();
}

class _NeoBottomNavigationBarState extends State<NeoBottomNavigationBar>
    with TickerProviderStateMixin {
  List<AnimationController> _controllerList;
  List<CurvedAnimation> _animationList;

  @override
  void initState() {
    super.initState();
    _controllerList = List.generate(widget.items.length, (index) {
      return AnimationController(vsync: this, duration: Duration(seconds: 1));
    });
    _animationList = List.generate(
        widget.items.length,
        (index) => CurvedAnimation(
              parent: _controllerList[index],
              curve: Curves.fastOutSlowIn,
              reverseCurve: Curves.fastOutSlowIn.flipped,
            ));
    _controllerList[widget.currentIndex].value = 1.0;
  }

  @override
  void dispose() {
    for (var controller in _controllerList) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(NeoBottomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.currentIndex != oldWidget.currentIndex) {
      _controllerList[oldWidget.currentIndex].reverse();
      _controllerList[widget.currentIndex].forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = <Widget>[];
    for (var i = 0; i < widget.items.length; i++) {
      tiles.add(_NeoBottomNavigationTile(
        icon: widget.items[i].icon,
        selected: i == widget.currentIndex,
        activeIcon: widget.items[i].activeIcon,
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap(i);
          }
        },
        animation: _animationList[i],
      ));
    }

    return BottomAppBar(
      elevation: 0.0,
      color: widget.backgroundColor,
      child: Container(
        color: widget.backgroundColor,
        padding: EdgeInsets.only(top: 4, left: 16, bottom: 8, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: tiles,
        ),
      ),
    );
  }
}

class _NeoBottomNavigationTile extends StatelessWidget {
  final VoidCallback onTap;
  final bool selected;
  final Widget icon;
  final Widget activeIcon;
  final Color backgroundColor;
  final Animation animation;
  static final BoxDecoration _defaultDecoration =
      BoxDecoration(borderRadius: BorderRadius.circular(8));
  const _NeoBottomNavigationTile(
      {Key key,
      this.onTap,
      this.selected,
      @required this.icon,
      this.activeIcon,
      this.animation,
      this.backgroundColor = neo_bg})
      : super(key: key);

  BoxDecoration setDecoration(bool isSelected, Color bgColor) {
    double xOffset;
    xOffset = Tween<double>(begin: 8.0, end: 0.0).evaluate(animation);
    double yOffset;
    yOffset = Tween<double>(begin: 6.0, end: 0.0).evaluate(animation);
    final double stop1 =
        Tween<double>(begin: 0.0, end: 0.1).evaluate(animation);
    final double stop2 =
        Tween<double>(begin: 1.0, end: 0.8).evaluate(animation);

    final color1 =
        ColorTween(begin: neo_bg, end: neo_bg_dark_shadow).evaluate(animation);
    final color2 =
        ColorTween(begin: neo_bg, end: Colors.white).evaluate(animation);

    return BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
            color: neo_bg_dark_shadow,
            offset: Offset(xOffset, yOffset),
            blurRadius: 12),
        BoxShadow(
            color: Colors.white,
            offset: Offset(-xOffset, -yOffset),
            blurRadius: 12),
      ],
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.8],
          colors: [color1, color2]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, widget) {
        return InkResponse(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(20),
            decoration: setDecoration(selected, backgroundColor),
            child: _NeoBottomNavigationIcon(
              icon: icon,
              activeIcon: activeIcon,
              animation: animation,
              selected: selected,
            ),
          ),
        );
      },
    );
  }
}

class _NeoBottomNavigationIcon extends StatelessWidget {
  final Widget icon;
  final Widget activeIcon;
  final bool selected;
  final Animation animation;
  const _NeoBottomNavigationIcon(
      {Key key, this.icon, this.activeIcon, this.selected, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  selected ? activeIcon : icon
    final double rotate =
        Tween<double>(begin: 0, end: pi * 2).evaluate(animation);

    return Transform.rotate(
      angle: sin(rotate),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 500),
        builder: (context, value, _) {
          return Opacity(opacity: value, child: selected ? activeIcon : icon);
        },
      ),
    );
  }
}
