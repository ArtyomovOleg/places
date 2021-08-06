import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/add_sight_screen.dart';
import 'package:places/ui/screens/res/text_styles.dart';

class SightSearchScreen extends StatelessWidget {
  const SightSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 64, 0, 16),
            child: Container(
              width: double.infinity,
              height: 72,
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Cписок\nинтересных мест',
                      style: Theme.of(context).textTheme.headline1),
                ]),
              ),
            ),
          ),
          SearchBarActive(),
          // Expanded(
          //   child: ListView(
          //     padding: const EdgeInsets.all(0),
          //     children: [
          //       for (final sight in mocks) SightCard(sight),
          //     ],
          //   ),
          // ),
        ]),
      ),
    );
  }
}

class SearchBarActive extends StatefulWidget {
  const SearchBarActive({Key? key}) : super(key: key);

  @override
  _SearchBarActiveState createState() => _SearchBarActiveState();
}

class _SearchBarActiveState extends State<SearchBarActive> {
  final TextEditingController _textEditingControllerSearch =
      TextEditingController();

  List<Sight> filteredMocks = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextField(
        controller: _textEditingControllerSearch,
        autofocus: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).cardColor,
          suffixIcon: ClearFieldButton(
              textEditingController: _textEditingControllerSearch),
          hintText: 'Поиск',
          hintStyle: addSightTextFieldTitle.copyWith(
            color: Theme.of(context).buttonTheme.colorScheme?.secondary,
          ),
          enabledBorder: withoutBorder(),
          focusedBorder: withoutBorder(),
          prefixIcon: SvgPicture.asset(
            'assets/icons/search.svg',
            color: Theme.of(context).buttonTheme.colorScheme?.secondary,
            width: 24,
            height: 24,
            fit: BoxFit.scaleDown,
          ),
        ),
        onChanged: (value) {
          setState(() {
            filteredMocks = mocks.where((element) {
              return element.name.contains(value);
            }).toList();
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _textEditingControllerSearch.dispose();
    super.dispose();
  }

  InputBorder withoutBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }
}
