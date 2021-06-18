import 'package:flutter/material.dart';

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
        toolbarHeight: 64 + 72,
        leadingWidth: 0,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
          child: Container(
            width: 328,
            height: 72,
            child: Align(
              child: Text(
                'Список\nинтересных мест',
                style: TextStyle(
                  color: Color(0xFF252849),
                  fontSize: 32.0,
                  height: 1.12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
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
