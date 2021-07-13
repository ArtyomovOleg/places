import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CatalogPanel extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool active;

  const CatalogPanel(this.title, this.iconPath, this.active, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      height: 92,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context)
                  .buttonTheme
                  .colorScheme
                  ?.background
                  .withOpacity(active ? 0.16 : 0),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 32,
                height: 32,
                color: Theme.of(context).buttonTheme.colorScheme?.background,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.caption?.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).buttonTheme.colorScheme?.primary,
                ),
          ),
        ],
      ),
    );
  }
}
