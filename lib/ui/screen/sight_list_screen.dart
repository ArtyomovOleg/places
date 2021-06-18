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
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'С',
                  style: TextStyle(
                    color: Color(0xFF4CAF50),
                    fontSize: 32.0,
                    height: 1.12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: 'писок\n',
                      style: TextStyle(
                        color: Color(0xFF3B3E5B),
                        fontSize: 32.0,
                        height: 1.12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                TextSpan(
                    text: 'и',
                    style: TextStyle(
                      color: Color(0xFFFCDD3D),
                      fontSize: 32.0,
                      height: 1.12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: 'нтересных мест',
                        style: TextStyle(
                          color: Color(0xFF3B3E5B),
                          fontSize: 32.0,
                          height: 1.12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]),
              ]),
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
