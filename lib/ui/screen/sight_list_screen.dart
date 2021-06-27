import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_details.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.7),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
              child: Container(
                width: double.infinity,
                height: 72,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Cписок\nинтересных мест',
                      style: TextStyle(
                        color: Color(0xFF3B3E5B),
                        fontSize: 32.0,
                        height: 1.12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.7 - 72 - 80,
              ),
              child: ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  for (final sight in mocks)
                    ListTile(
                      title: SightCard(sight),
                      contentPadding: const EdgeInsets.all(0),
                      horizontalTitleGap: 0,
                      minVerticalPadding: 0,
                      onTap: () {
                        print('Tap on: ${sight.name}');
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                SightDetails(sight),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ]),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Hello!',
              hintText: 'Hello!',
            ),
            autofocus: true,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
