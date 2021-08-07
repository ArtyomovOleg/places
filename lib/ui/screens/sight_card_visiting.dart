import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:places/domain/sight.dart';
import 'package:places/ui/screens/res/svg_pictures.dart';
import 'package:places/ui/screens/res/text_styles.dart';

class SightCardWantVisit extends StatefulWidget {
  final Sight sight;
  final Function favoriteSwitchSight;

  SightCardWantVisit(this.sight, this.favoriteSwitchSight, {Key? key})
      : super(key: key);

  @override
  _SightCardWantVisitState createState() => _SightCardWantVisitState();
}

class _SightCardWantVisitState extends State<SightCardWantVisit> {
  bool calendarStatus = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            topPart(context),
            bottomPart(context),
          ],
        ),
      ),
    );
  }

  Container bottomPart(BuildContext context) {
    return Container(
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
            padding: EdgeInsets.fromLTRB(16, 0, 16, 2),
            child: Container(
              height: 28,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Цель достигнута 12 окт. 2020',
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.justify,
                  style: sightCardVisitingTitle,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'закрыто до 09:00',
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.justify,
                  style: sightCardVisitingWorkTime,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container topPart(BuildContext context) {
    return Container(
      height: 96,
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
              ? imageFutureBuilder()
              : Container(),
          titleSightType(context),
          Positioned(
            right: 16,
            top: 16,
            child: Row(
              children: [
                calendarButton(context),
                SizedBox(width: 16),
                closeButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox closeButton() {
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        padding: const EdgeInsets.all(0),
        iconSize: 24,
        onPressed: () {
          print('$runtimeType (${widget.sight.type}) close icon has pressed');
          widget.favoriteSwitchSight(widget.sight);
        },
        icon: Icon(Icons.close_rounded, color: Colors.white),
      ),
    );
  }

  SizedBox calendarButton(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        padding: const EdgeInsets.all(0),
        iconSize: 24,
        onPressed: () {
          print(
              '$runtimeType (${widget.sight.type}) calendar icon has pressed');
          setState(() {
            calendarStatus = !calendarStatus;
          });
        },
        icon: calendarStatus
            ? SvgIcon(context, 'CalendarFill', color: Colors.white)
            : SvgIcon(context, 'CalendarOutline', color: Colors.white),
      ),
    );
  }

  Positioned titleSightType(BuildContext context) {
    return Positioned(
      left: 16,
      top: 16,
      child: Text(
        widget.sight.type.toString().split('.').last,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Future<Image> _topImage() {
    return Future<Image>.delayed(
      const Duration(seconds: 1), // задержка для демонстрации лоадера
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

class SightCardVisited extends StatefulWidget {
  final Sight sight;

  final iconShare = SvgPicture.asset(
    'assets/icons/share.svg',
    width: 24,
    height: 24,
  );

  SightCardVisited(this.sight, {Key? key}) : super(key: key);

  @override
  _SightCardVisitedState createState() => _SightCardVisitedState();
}

class _SightCardVisitedState extends State<SightCardVisited> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 96,
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
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            iconSize: 24,
                            onPressed: () {
                              print(
                                  '$runtimeType (${widget.sight.type}) share icon has pressed');
                            },
                            icon: widget.iconShare,
                          ),
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            iconSize: 24,
                            onPressed: () {
                              print(
                                  '$runtimeType (${widget.sight.type}) close icon has pressed');
                            },
                            icon: Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 2),
                    child: Container(
                      height: 28,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Цель достигнута 12 окт. 2020',
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.justify,
                          style: sightCardVisitingAchieved,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'закрыто до 09:00',
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.justify,
                          style: sightCardVisitingAchieved,
                        ),
                      ),
                    ),
                  ),
                ],
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
