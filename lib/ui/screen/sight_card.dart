import 'package:flutter/material.dart';

import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        height: 188,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF0000DD),
                      Color(0xFFDD11DD),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment(0, 0.6),
                  ),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    sight.assetImagePath.isNotEmpty
                        // ? Image.asset(sight.assetImagePath)
                        ? imageFutureBuilder()
                        : Container(),
                    Positioned(
                      left: 16,
                      top: 16,
                      child: Text(
                        sight.type.toString().split('.').last,
                        style: const TextStyle(
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
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  color: Color(0xFFF5F5F5),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 2),
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          sight.name,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Color(0xFF3B3E5B),
                            fontSize: 16.0,
                            height: 1.25,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Container(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: LayoutBuilder(builder: (
                            BuildContext context,
                            BoxConstraints constraints,
                          ) {
                            return ConstrainedBox(
                              constraints: BoxConstraints.loose(
                                Size(
                                  constraints.maxWidth / 2,
                                  21,
                                ),
                              ),
                              child: Text(
                                sight.details,
                                overflow: TextOverflow.fade,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: Color(0xFF7C7E92),
                                  fontSize: 14.0,
                                  height: 1.28571,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Image> _topImage() {
    return Future<Image>.delayed(
      const Duration(seconds: 1), // задержка для демонстрации лоадера
      () => Image.asset(
        sight.assetImagePath,
        fit: BoxFit.cover,
        colorBlendMode: BlendMode.lighten,
        color: Colors.white24,
      ),
    );
  }

  FutureBuilder<Image> imageFutureBuilder() {
    return FutureBuilder<Image>(
      future: _topImage(),
      builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
        Widget child;
        if (snapshot.hasData) {
          child = DecoratedBox(
            child: Container(),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              image: DecorationImage(
                image: snapshot.data!.image,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white24,
                  BlendMode.lighten,
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          child = Container();
        } else {
          child = Center(
            child: SizedBox(
              child: CircularProgressIndicator(),
              width: 20,
              height: 20,
            ),
          );
        }
        return child;
      },
    );
  }
}
