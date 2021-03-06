import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:places/domain/sight.dart';
import 'package:places/ui/screens/res/text_styles.dart';
import 'package:places/ui/universal/buttons.dart';

class SightDetails extends StatelessWidget {
  final Sight sight;

  const SightDetails(this.sight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 288,
                      height: 360,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFDD0000),
                            Color(0xFFDDDD11),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment(0.6, 0),
                        ),
                        image: sight.assetImagePath.isNotEmpty
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: ExactAssetImage(sight.assetImagePath),
                              )
                            : null,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 288,
                        height: 360,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF0000DD),
                              Color(0xFFDD11DD),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment(0, 0.6),
                          ),
                          image: sight.assetImagePath.isNotEmpty
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: ExactAssetImage(sight.assetImagePath),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 16,
                top: 36,
                child: BackButtonCentered(),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      sight.name,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Row(children: [
                    Text(
                      sight.type.toString().split('.').last,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Opacity(
                        opacity: 0.56,
                        child: Text(
                          '?????????????? ???? 09:00',
                          style: sightDetailsWorkTime,
                        ),
                      ),
                    ),
                  ])
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                width: double.infinity,
                child: Text(
                  sight.details,
                  textAlign: TextAlign.justify,
                  style: sightDetailsTitle(context),
                ),
              ),
              InkWell(
                onTap: () {
                  print('$runtimeType plot a course');
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      color:
                          Theme.of(context).buttonTheme.colorScheme?.background,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/go.svg',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          '?????????????????? ??????????????',
                          style: sightDetailsPlotACourse,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.24,
                child: Divider(
                  height: 16,
                  thickness: 0.8,
                  color: Color(0x8F7C7E92),
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: InkWell(
                      onTap: () {
                        print('$runtimeType Plan button has been pressed');
                      },
                      child: Container(
                        height: 40,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/calendar_outline.svg',
                                color: Theme.of(context)
                                    .buttonTheme
                                    .colorScheme
                                    ?.secondary,
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                '??????????????????????????',
                                style: sightDetailsButtonShadowed(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: InkWell(
                      onTap: () {
                        print('$runtimeType Favorite button has been pressed');
                      },
                      child: Container(
                        height: 40,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/heart_unchecked.svg',
                                color: Theme.of(context)
                                    .buttonTheme
                                    .colorScheme
                                    ?.primary,
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                '?? ??????????????????',
                                style: sightDetailsButtonActive(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          )
        ]),
      ),
    );
  }
}
