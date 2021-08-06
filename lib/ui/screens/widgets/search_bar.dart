import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:places/ui/screens/filters_screen.dart';
import 'package:places/ui/screens/res/text_styles.dart';
import 'package:places/ui/screens/sight_search_screen.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        autofocus: false,
        readOnly: true,
        showCursor: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).cardColor,
          suffixIcon: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/filter.svg',
              color: Theme.of(context).buttonTheme.colorScheme?.background,
            ),
            iconSize: 24,
            onPressed: () {
              print('$runtimeType tap on filter');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => FiltersScreen(),
                ),
              );
            },
          ),
          hintText: 'Поиск',
          hintStyle: addSightTextFieldTitle.copyWith(
            color: Theme.of(context).buttonTheme.colorScheme?.secondary,
          ),
          enabledBorder: withoutBorder(),
          focusedBorder: withoutBorder(),
          prefixIcon: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Theme.of(context).buttonTheme.colorScheme?.secondary,
            ),
            iconSize: 24,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SightSearchScreen(),
                ),
              );
            },
          ),
        ),
        onTap: () {
          print('Nothing to do');
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context) => SightSearchScreen(),
          //   ),
          // );
        },
      ),
    );
  }

  InputBorder withoutBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }
}
