import 'package:flutter/material.dart';

class BackButtonCentered extends StatelessWidget {
  const BackButtonCentered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).maybePop();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 32,
        height: 32,
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
            color: Theme.of(context).buttonColor,
          ),
        ),
      ),
    );
  }
}
