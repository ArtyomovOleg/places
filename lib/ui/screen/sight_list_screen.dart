import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:places/mocks.dart';
import 'package:places/domain/sight.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.7,
        leadingWidth: 0,
        title: Column(children: [
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
                    title: SightPreview(sight),
                    contentPadding: const EdgeInsets.all(0),
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                  ),
              ],
            ),
          ),
        ]),
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

class SightPreview extends StatelessWidget {
  final Sight sight;

  SightPreview(this.sight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        height: 96 + 92,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 96,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0000DD),
                      Color(0xFFDD11DD),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment(0, 0.6),
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      left: 16,
                      top: 16,
                      child: Text(
                        sight.type.toString().split('.')[1],
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14.0,
                          height: 1.28571,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 18,
                      top: 19,
                      child: Icon(
                        Icons.star_border_rounded,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 92,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  color: Color(0xFFF5F5F5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
