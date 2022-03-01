import 'package:flutter/material.dart';

class CountButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  const CountButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 80,
        height: 40,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.red,
        onPressed: () => onTap(),
        child: Icon(
          icon,
          color: Colors.white,
        ));
  }
}
