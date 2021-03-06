import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:places/domain/sight.dart';
import 'package:places/ui/screens/sight_details.dart';

class SightCard extends StatefulWidget {
  final Sight sight;
  final List<SvgPicture> iconsHeart = [
    SvgPicture.asset('assets/icons/heart_unchecked.svg'),
    SvgPicture.asset('assets/icons/heart_checked.svg'),
  ];

  SightCard(this.sight, {Key? key}) : super(key: key);

  @override
  _SightCardState createState() => _SightCardState();
}

class _SightCardState extends State<SightCard> {
  int heartIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 188,
      width: double.infinity,
      child: Material(
        child: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Tap on: ${widget.sight.name}',
                  style: TextStyle(
                    color: Theme.of(context).buttonColor,
                  ),
                ),
                backgroundColor:
                    Theme.of(context).scaffoldBackgroundColor.withAlpha(0x8F),
                elevation: 3,
              ),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => SightDetails(widget.sight),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 3,
                child: Ink(
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
                      widget.sight.assetImagePath.isNotEmpty
                          // ? Image.asset(sight.assetImagePath)
                          ? imageFutureBuilder()
                          : Container(),
                      Positioned(
                        left: 16,
                        top: 16,
                        child: Text(
                          widget.sight.type.toString().split('.').last,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: 16,
                        child: IconButton(
                          onPressed: () {
                            print(
                                '$runtimeType (${widget.sight.type}) heart icon has pressed');
                            setState(() {
                              heartIndex = (heartIndex - 1).abs();
                            });
                          },
                          icon: widget.iconsHeart[heartIndex],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Ink(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 2),
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            widget.sight.name,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.headline5,
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
                                  '?????????????? ???? 09:00',
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.subtitle2,
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
      ),
    );
  }

  Future<Image> _topImage() {
    return Future<Image>.delayed(
      const Duration(seconds: 1), // ???????????????? ?????? ???????????????????????? ??????????????
      () => Image.asset(
        widget.sight.assetImagePath,
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
          child = Ink(
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
