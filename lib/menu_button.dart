import 'package:animate_container/custom_icons.dart';
import 'package:flutter/material.dart';


class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    this.color = Colors.white70,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'menu-button',
      child: Material(
        type: MaterialType.transparency,
        child: IconButton(
          onPressed: () {},
          icon: Icon(CustomIcons.menu, size: 30, color: color),
        ),
      ),
    );
  }
}
