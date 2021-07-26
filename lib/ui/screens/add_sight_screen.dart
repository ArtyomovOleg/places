import 'package:flutter/material.dart';

import 'package:places/domain/sight.dart';
import 'package:places/ui/screens/res/border_styles.dart';
import 'package:places/ui/screens/res/text_styles.dart';
import 'package:places/ui/universal/buttons.dart';

class AddSightScreen extends StatefulWidget {
  final Function mockAddSight;

  AddSightScreen({Key? key, required this.mockAddSight}) : super(key: key);

  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final FocusNode _focusNodeCategory = FocusNode();
  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeLatitude = FocusNode();
  final FocusNode _focusNodeLongitude = FocusNode();
  final FocusNode _focusNodeDescription = FocusNode();

  final TextEditingController _textEditingControllerCategory =
      TextEditingController();
  final TextEditingController _textEditingControllerName =
      TextEditingController();
  final TextEditingController _textEditingControllerLatitude =
      TextEditingController();
  final TextEditingController _textEditingControllerLongitude =
      TextEditingController();
  final TextEditingController _textEditingControllerDescription =
      TextEditingController();

  bool createButtonActive = false;
  SightType selectedSightType = SightType.None;

  void checkFilledFields() {
    bool _activeButton;
    if (_textEditingControllerCategory.text.isNotEmpty &&
        _textEditingControllerName.text.isNotEmpty &&
        _textEditingControllerLatitude.text.isNotEmpty &&
        _textEditingControllerLongitude.text.isNotEmpty &&
        _textEditingControllerDescription.text.isNotEmpty) {
      _activeButton = true;
    } else {
      _activeButton = false;
    }

    setState(() {
      createButtonActive = _activeButton;
    });
  }

  setSelectedSightType(SightType sightType) {
    setState(() {
      selectedSightType = sightType;
      _textEditingControllerCategory.text =
          sightType.toString().split('.').last;
    });
  }

  void mockAddSight() {
    Sight sight = Sight()
      ..type = selectedSightType
      ..name = _textEditingControllerName.text
      ..lat = double.tryParse(_textEditingControllerLatitude.text) ?? 0
      ..lon = double.tryParse(_textEditingControllerLongitude.text) ?? 0
      ..details = _textEditingControllerDescription.text;
    widget.mockAddSight(sight);
    print('$runtimeType mockAddSight');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          alignment: Alignment.center,
          child: InkWell(
            child: Text(
              'Отмена',
              style: addSightTopCancelTitle,
            ),
            onTap: () => Navigator.of(context).maybePop(),
          ),
          margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        ),
        leadingWidth: 58 + 32,
        title: Text(
          'Новое место',
          style: addSightTopTitle,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 24),
                          child: Text(
                            'КАТЕГОРИЯ',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: TextField(
                            focusNode: _focusNodeCategory,
                            controller: _textEditingControllerCategory,
                            showCursor: false,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.chevron_right_rounded,
                                size: 24,
                                color: Theme.of(context).buttonColor,
                              ),
                              hintText: 'Не выбрано',
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      SelectCategory(setSelectedSightType),
                                ),
                              );
                            },
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodeName);
                              checkFilledFields();
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            'НАЗВАНИЕ',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: TextField(
                            focusNode: _focusNodeName,
                            controller: _textEditingControllerName,
                            cursorColor: Theme.of(context)
                                .textSelectionTheme
                                .cursorColor,
                            cursorHeight: 24,
                            cursorWidth: 1,
                            cursorRadius: const Radius.circular(1),
                            showCursor: true,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.sentences,
                            keyboardType: TextInputType.name,
                            style: settingsTitle(context),
                            // focusNode: ,
                            decoration: InputDecoration(
                              hintText: 'Золотая долина',
                              border: addSightBorder,
                              enabledBorder: addSightBorder,
                              focusedBorder: addSightBorderFocused,
                              suffixIcon: _focusNodeName.hasFocus
                                  ? ClearFieldButton(
                                      textEditingController:
                                          _textEditingControllerName,
                                    )
                                  : SizedBox.shrink(),
                            ),
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodeLatitude);
                              checkFilledFields();
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Text(
                                      'ШИРОТА',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: TextField(
                                      focusNode: _focusNodeLatitude,
                                      controller:
                                          _textEditingControllerLatitude,
                                      cursorColor: Theme.of(context)
                                          .textSelectionTheme
                                          .cursorColor,
                                      cursorHeight: 24,
                                      cursorWidth: 1,
                                      cursorRadius: const Radius.circular(1),
                                      showCursor: true,
                                      textInputAction: TextInputAction.next,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                        signed: true,
                                        decimal: true,
                                      ),
                                      style: settingsTitle(context),
                                      // focusNode: ,
                                      decoration: InputDecoration(
                                        hintText: '0.0',
                                        border: addSightBorder,
                                        enabledBorder: addSightBorder,
                                        focusedBorder: addSightBorderFocused,
                                        suffixIcon: _focusNodeLatitude.hasFocus
                                            ? ClearFieldButton(
                                                textEditingController:
                                                    _textEditingControllerLatitude,
                                              )
                                            : SizedBox.shrink(),
                                      ),
                                      onEditingComplete: () {
                                        FocusScope.of(context)
                                            .requestFocus(_focusNodeLongitude);
                                        checkFilledFields();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Text(
                                      'ДОЛГОТА',
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: TextField(
                                      focusNode: _focusNodeLongitude,
                                      controller:
                                          _textEditingControllerLongitude,
                                      cursorColor: Theme.of(context)
                                          .textSelectionTheme
                                          .cursorColor,
                                      cursorHeight: 24,
                                      cursorWidth: 1,
                                      cursorRadius: const Radius.circular(1),
                                      showCursor: true,
                                      textInputAction: TextInputAction.next,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      keyboardType:
                                          TextInputType.numberWithOptions(
                                        signed: true,
                                        decimal: true,
                                      ),
                                      style: settingsTitle(context),
                                      // focusNode: ,
                                      decoration: InputDecoration(
                                        hintText: '0.0',
                                        border: addSightBorder,
                                        enabledBorder: addSightBorder,
                                        focusedBorder: addSightBorderFocused,
                                        suffixIcon: _focusNodeLongitude.hasFocus
                                            ? ClearFieldButton(
                                                textEditingController:
                                                    _textEditingControllerLongitude,
                                              )
                                            : SizedBox.shrink(),
                                      ),
                                      onEditingComplete: () {
                                        FocusScope.of(context).requestFocus(
                                            _focusNodeDescription);
                                        checkFilledFields();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Указать на карте',
                            style: addSightMapLink(context),
                          ),
                        ),
                        SizedBox(height: 37),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Text(
                            'ОПИСАНИЕ',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: TextField(
                            focusNode: _focusNodeDescription,
                            controller: _textEditingControllerDescription,
                            cursorColor: Theme.of(context)
                                .textSelectionTheme
                                .cursorColor,
                            cursorHeight: 24,
                            cursorWidth: 1,
                            cursorRadius: const Radius.circular(1),
                            showCursor: true,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.sentences,
                            keyboardType: TextInputType.multiline,
                            style: settingsTitle(context),
                            maxLines: null,
                            minLines: 3,
                            decoration: InputDecoration(
                              hintText: 'введите текст',
                              border: addSightBorder,
                              enabledBorder: addSightBorder,
                              focusedBorder: addSightBorderFocused,
                              suffixIcon: _focusNodeDescription.hasFocus
                                  ? ClearFieldButton(
                                      textEditingController:
                                          _textEditingControllerDescription,
                                    )
                                  : SizedBox.shrink(),
                            ),
                            onEditingComplete: () {
                              FocusScope.of(context).unfocus();
                              checkFilledFields();
                            },
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: CreateSightButton(
                              createButtonActive: createButtonActive,
                              mockAddSight: mockAddSight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ClearFieldButton extends StatelessWidget {
  final TextEditingController textEditingController;

  const ClearFieldButton({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Theme.of(context).buttonColor,
      onPressed: () {
        textEditingController.clear();
      },
      icon: Icon(Icons.cancel_rounded),
    );
  }
}

class CreateSightButton extends StatefulWidget {
  final bool createButtonActive;
  final Function mockAddSight;

  const CreateSightButton({
    Key? key,
    required this.createButtonActive,
    required this.mockAddSight,
  }) : super(key: key);

  @override
  _CreateSightButtonState createState() => _CreateSightButtonState();
}

class _CreateSightButtonState extends State<CreateSightButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.createButtonActive) {
          print('$runtimeType sight create');
          widget.mockAddSight();
          Navigator.of(context).maybePop();
        }
      },
      child: Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: widget.createButtonActive
                ? Theme.of(context).buttonTheme.colorScheme?.background
                : Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
          child: Text(
            'СОЗДАТЬ',
            style: addSightCreateButtonTitle.copyWith(
              color: widget.createButtonActive
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).buttonTheme.colorScheme?.secondary,
            ),
          ),
        ),
      ),
    );
  }
}

class SelectCategory extends StatefulWidget {
  final Function setSelectedSightType;

  const SelectCategory(this.setSelectedSightType, {Key? key}) : super(key: key);

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  SightType groupValue = SightType.None;

  void setGroupValue(SightType value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: InkWell(
              child: BackButtonCentered(),
              onTap: () => Navigator.of(context).maybePop(),
            ),
            margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          ),
        ),
        leadingWidth: 58 + 32,
        title: Text(
          'Категория',
          style: addSightTopTitle,
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      for (final sightType in SightType.values)
                        CategoryEntry(sightType, groupValue, setGroupValue),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              {
                                print('$runtimeType sight type choise');
                                widget.setSelectedSightType(groupValue);
                                Navigator.of(context).maybePop();
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              height: 48,
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme
                                      ?.background,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  'СОХРАНИТЬ',
                                  style: addSightCreateButtonTitle.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class CategoryEntry extends StatefulWidget {
  final SightType sightType;
  final SightType groupValue;
  final Function setGroupValue;

  CategoryEntry(this.sightType, this.groupValue, this.setGroupValue, {Key? key})
      : super(key: key);

  @override
  _CategoryEntryState createState() => _CategoryEntryState();
}

class _CategoryEntryState extends State<CategoryEntry> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.sightType.toString().split('.').last,
            style: settingsTitle(context),
          ),
          trailing: Radio(
            value: widget.sightType,
            groupValue: widget.groupValue,
            onChanged: (var value) {
              widget.setGroupValue(value);
            },
          ),
        ),
        Divider(),
      ],
    );
  }
}
