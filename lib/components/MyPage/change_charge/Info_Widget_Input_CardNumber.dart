import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:provider/provider.dart';

import '../../CardRegister/TextFied_Card.dart';
import '../../SignUp/Widget_of_Name.dart';
import '../changeBankCard/TextFieldWidgerBankCardInputChange.dart';
import '../changeBankCard/TextFieldWidgetBankCard.dart';
import '../changeBankCard/TextFieldWidgetBankCardHiden.dart';
import 'dart:math';
import 'TextFieldWidgetCard.dart';
import 'Wiget_choose.dart';
import '../../../model/UseMultiProvider.dart';

enum Navigators { checked, notcheked, checked3, notcheked3, checked1, notcheked1, checked2, notcheked2,  }

//
// class Info_Widget_Input_Card_Number extends StatefulWidget {
//   const Info_Widget_Input_Card_Number({
//     required this.borderSide,
//     required this.title,
//     required this.value,
//     Key? key,
//   }) : super(key: key);
//
//   final BorderSide borderSide;
//   final String title;
//   final String value;
//
//   @override
//   State<Info_Widget_Input_Card_Number> createState() =>
//       _Info_Widget_Input_Card_NumberState();
// }
//
// class _Info_Widget_Input_Card_NumberState
//     extends State<Info_Widget_Input_Card_Number> {
//   final transportcard = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     final double screenHeight = screenSize.height;
//     final double screenWidth = screenSize.width;
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//       decoration: BoxDecoration(border: Border(bottom: widget.borderSide)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             widget.title,
//             style: screenWidth > 900 || screenWidth > 600
//                 ? loginText_l
//                 : loginText,
//           ),
//           SizedBox(height: 10),
//           TextFieldWidget_Bank_Card_input(
//               passwordController: transportcard,
//               hintextl: '16자리',
//               isPassword: false),
//         ],
//       ),
//     );
//   }
// }

class Info_Widget_Input_Card_Numberx4 extends StatefulWidget {
  const Info_Widget_Input_Card_Numberx4({
    required this.borderSide,
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);

  final BorderSide borderSide;
  final String title;
  final String value;

  @override
  State<Info_Widget_Input_Card_Numberx4> createState() =>
      _Info_Widget_Input_Card_NumberStatex4();
}

class _Info_Widget_Input_Card_NumberStatex4
    extends State<Info_Widget_Input_Card_Numberx4> {
  final transportcard1 = TextEditingController();
  final transportcard2 = TextEditingController();
  final transportcard3 = TextEditingController();
  final transportcard4 = TextEditingController();
  FocusNode _focus = FocusNode();
  FocusNode _focus3 = FocusNode();
  FocusNode _focus2 = FocusNode();
  FocusNode _focus1 = FocusNode();
  Navigators checked = Navigators.notcheked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _focus.addListener(_onFocusChange);
      _focus1.addListener(_onFocusChange1);
      _focus2.addListener(_onFocusChange2);
      _focus3.addListener(_onFocusChange3);
      transportcard4.addListener(_checkInputLength);
      transportcard3.addListener(_checkInputLength);
      transportcard2.addListener(_checkInputLength);
      transportcard1.addListener(_checkInputLength);
    });
  }

  void _onFocusChange() {
    print("Focus4: ${_focus.hasFocus.toString()}");
    if (!_focus.hasFocus) {
      checked = Navigators.notcheked;
    } else {
      checked = Navigators.checked;
    }
  }

  void _onFocusChange1() {
    print("Focus1: ${_focus1.hasFocus.toString()}");
    if (!_focus1.hasFocus) {
      checked = Navigators.notcheked1;
    }else {
      checked = Navigators.checked1;
    }
  }

  void _onFocusChange2() {
    print("Focus2: ${_focus2.hasFocus.toString()}");
    if (!_focus2.hasFocus) {
      checked = Navigators.notcheked2;
    } else {
      checked = Navigators.checked2;
    }
  }
  void _onFocusChange3() {
    print("Focus3: ${_focus3.hasFocus.toString()}");
    if (!_focus3.hasFocus) {
      checked = Navigators.notcheked3;
    } else {
      checked = Navigators.checked3;
    }
  }
  void _checkInputLength() {
    if (checked == Navigators.checked) {
      if (transportcard4.text.length > 4) {
        final newSelection = TextSelection.collapsed(
          offset: transportcard4.text.length,
          affinity: TextAffinity.downstream,
        );
        transportcard4.value = TextEditingValue(
          text: transportcard4.text.substring(0, 4),
          selection: newSelection,
        );
      }
    } else if (checked == Navigators.checked3) {
      if (transportcard3.text.length > 4) {
        final newSelection = TextSelection.collapsed(
          offset: transportcard3.text.length,
          affinity: TextAffinity.downstream,
        );
        transportcard3.value = TextEditingValue(
          text: transportcard3.text.substring(0, 4),
          selection: newSelection,
        );
      }
    } else if (checked == Navigators.checked2) {
      if (transportcard2.text.length > 4) {
        final newSelection = TextSelection.collapsed(
          offset: transportcard2.text.length,
          affinity: TextAffinity.downstream,
        );
        transportcard2.value = TextEditingValue(
          text: transportcard2.text.substring(0, 4),
          selection: newSelection,
        );
      }
    } else if (checked == Navigators.checked1) {
      if (transportcard1.text.length > 4) {
        final newSelection = TextSelection.collapsed(
          offset: transportcard1.text.length,
          affinity: TextAffinity.downstream,
        );
        transportcard1.value = TextEditingValue(
          text: transportcard1.text.substring(0, 4),
          selection: newSelection,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {



    final stringprovider = Provider.of<DataMulti>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Stack(children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(border: Border(bottom: widget.borderSide)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: screenWidth > 900 || screenWidth > 600
                  ? loginText_l
                  : loginText,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child:  Container(
                    height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff2d3748),
                        border: Border.all(
                          width: 0,
                          color: Color(0xff2d3748)
                        )
                      ),
                      child: Text_Field(screenWidth, transportcard1, '1',_focus1)),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff2d3748),
                        border: Border.all(
                          width: 0,
                          color: Color(0xff2d3748)
                        )
                      ),
                      child: Text_Field(screenWidth, transportcard2, '2',_focus2)),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xff2d3748),
                      border: Border.all(
                        width: 0,
                        color: Color(0xff2d3748),
                      ),
                    ),
                    child: Text_Field(screenWidth, transportcard3, '3',_focus3),
                  ),
                ])),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xff2d3748),
                      border: Border.all(
                        width: 0,
                        color: Color(0xff2d3748),
                      ),
                    ),
                    child: Text_Field(screenWidth, transportcard4, '4', _focus),
                  ),
                ])),
              ],
            )
          ],
        ),
      ),
      checked == Navigators.checked || checked == Navigators.checked3 || checked == Navigators.checked2 || checked == Navigators.checked1
          ? CustomKeyboard(
              onTextInput: (myText) {
                _insertText(
                    myText,
                    checked == Navigators.checked
                        ? transportcard4
                        : checked == Navigators.checked3
                            ? transportcard3
                        : checked == Navigators.checked2
                        ? transportcard2
                        : checked == Navigators.checked1
                        ? transportcard1
                        : null);
              },
              onCleartext: () {
                if (checked == Navigators.checked) {
                  transportcard4.clear();
                } else if (checked == Navigators.checked3) {
                  transportcard3.clear();
                }else if (checked == Navigators.checked2) {
                  transportcard2.clear();
                }else if (checked == Navigators.checked1) {
                  transportcard1.clear();
                }
              },
              onBackspace: () {
                _backspace(checked == Navigators.checked
                    ? transportcard4
                    : checked == Navigators.checked3
                        ? transportcard3
                    : checked == Navigators.checked2
                    ? transportcard2
                    :  checked == Navigators.checked1
                    ? transportcard1
                    : null);
              },
              onCheckspace: () {
                setState(() {
                  stringprovider
                      .setcreditcardregistnumber4(transportcard4.text);
                  stringprovider
                      .setcreditcardregistnumber3(transportcard3.text);
                  stringprovider
                      .setcreditcardregistnumber2(transportcard2.text);
                  stringprovider
                      .setcreditcardregistnumber1(transportcard1.text);
                  if (checked == Navigators.checked) {
                    checked = Navigators.notcheked;
                  } else if (checked == Navigators.checked3) {
                    checked = Navigators.notcheked3;
                  }
                  else if (checked == Navigators.checked2) {
                    checked = Navigators.notcheked2;
                  }
                  else if (checked == Navigators.checked1) {
                    checked = Navigators.notcheked1;
                  }
                });
              },
            )
          : Container()
    ]);
  }


  TextField Text_Field(
      double screenWidth, TextEditingController transportcard, String type, FocusNode focus) {

    return TextField(
      maxLength: 1,
      buildCounter: (BuildContext context,
          {int? currentLength, int? maxLength, bool? isFocused}) {
        if (currentLength == maxLength) {
          return null;
        }
        return Container(
          height: 0,
          width: 0,
        );
      },
      onTap: () {
        setState(() {
          if (type == '4') {
            checked = Navigators.checked;
          } else  if (type == '3'){
            checked = Navigators.checked3;
          }else  if (type == '2'){
            checked = Navigators.checked2;
          }else  if (type == '1'){
            checked = Navigators.checked1;
          }
        });
        print(checked);
      },
      controller: transportcard,
      decoration: InputDecoration(
        hintStyle:
            screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      ),
      style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth > 900 || screenWidth > 600 ? 20 : 15),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      showCursor: true,
      readOnly: true,
      autofocus: false,
      focusNode: focus,
      onChanged: (value) {
        print(value);
        // Remove all non-digit characters from the string
        setState(() {
          transportcard.text = value;
        });
      },
    );
  }

  void _insertText(String myText, transportcardfun) {
    final text = transportcardfun.text;
    final textSelection = transportcardfun.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    transportcardfun.text = newText;
    transportcardfun.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace(transportcardfun) {
    final text = transportcardfun.text;
    final textSelection = transportcardfun.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      transportcardfun.text = newText;
      transportcardfun.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    transportcardfun.text = newText;
    transportcardfun.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  void dispose() {
    transportcard4.dispose();
    transportcard3.dispose();
    super.dispose();
  }
}

class CustomKeyboard extends StatelessWidget {
  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final VoidCallback onCheckspace;
  final VoidCallback onCleartext;

  const CustomKeyboard(
      {super.key,
      required this.onTextInput,
      required this.onBackspace,
      required this.onCheckspace,
      required this.onCleartext});

  void _textInputHandler(String text) => onTextInput?.call(text);

  void _cleartextHandler() => onCleartext?.call();

  void _backspaceHandler() => onBackspace?.call();

  void _checkspaceHandler() => onCheckspace?.call();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(top: 110),
      color: Color(0xff4e565c),
      child: Column(
        children: [
          buildRowOne(),
          buildRowTwo(),
          buildRowThree(),
        ],
      ),
    );
  }

  Expanded buildRowOne() {
    List<Widget> rowChildren = [
      EmptyKey(text: '', onTextInput: _textInputHandler, flex: 1),
      TextKey(text: '1', onTextInput: _textInputHandler, flex: 1),
      TextKey(text: '9', onTextInput: _textInputHandler, flex: 1),
      TextKey(text: '7', onTextInput: _textInputHandler, flex: 1),
      TextKey(text: '4', onTextInput: _textInputHandler, flex: 1),
      TextKey(text: '5', onTextInput: _textInputHandler, flex: 1),
    ];

    Random random = Random();
    rowChildren.shuffle(random);
    return Expanded(
      child: Row(
        children: rowChildren
      ),
    );
  }

  Expanded buildRowTwo() {
    List<Widget> rowChildre = [
      TextKey(text: '6', onTextInput: _textInputHandler, flex: 1),
      TextKey(text: '3', onTextInput: _textInputHandler, flex: 1),
      EmptyKey(text: '', onTextInput: _textInputHandler, flex: 1),
      TextKey(text: '8', onTextInput: _textInputHandler, flex: 1),
      TextKey(text: '2', onTextInput: _textInputHandler, flex: 1),
      TextKey(text: '0', onTextInput: _textInputHandler, flex: 1),
    ];
    Random random = Random();
     rowChildre.shuffle(random);
    return Expanded(
      child: Row(
        children: rowChildre,
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          ClearKey(
            text: 'clear',
            flex: 1,
            onClearText: _cleartextHandler,
          ),
          BackspaceKey(
            onBackspace: _backspaceHandler,
            flex: 1,
          ),
          Checkkey(
            onCheckspace: _checkspaceHandler,
            flex: 2,
          ),
        ],
      ),
    );
  }
}

class ClearKey extends StatelessWidget {
  final String text;
  final VoidCallback onClearText;
  final int flex;

  const ClearKey(
      {super.key,
      required this.text,
      required this.onClearText,
      required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Material(
          color: Color(0xff747474),
          child: InkWell(
            onTap: () {
              onClearText?.call();
            },
            child: Container(
              child: Center(
                  child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          ),
        ),
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;

  const TextKey(
      {super.key,
      required this.text,
      required this.onTextInput,
      required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Material(
          color: Color(0xffe1e1e1),
          child: Container(
            decoration: BoxDecoration(),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                onTextInput?.call(text);
              },
              child: Container(
                child: Center(
                    child: Text(
                  text,
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyKey extends StatelessWidget {
  final String text;
  final ValueSetter<String> onTextInput;
  final int flex;

  const EmptyKey(
      {super.key,
      required this.text,
      required this.onTextInput,
      required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Material(
          color: Color(0xffe1e1e1),
          child: Container(
            decoration: BoxDecoration(),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: Container(
                child: Center(child: Text(text)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  final VoidCallback onBackspace;
  final int flex;

  const BackspaceKey(
      {super.key, required this.onBackspace, required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Material(
          color: Color(0xff747474),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              onBackspace?.call();
            },
            child: Container(
              child: Center(
                child: Icon(
                  Icons.backspace,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Checkkey extends StatefulWidget {
  final VoidCallback onCheckspace;
  final int flex;

  const Checkkey({super.key, required this.onCheckspace, required this.flex});

  @override
  State<Checkkey> createState() => _CheckkeyState();
}

class _CheckkeyState extends State<Checkkey> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Material(
          color: Color(0xff2473b0),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              setState(() {
                widget.onCheckspace?.call();
              });
              print(checked);
            },
            child: Container(
              child: Center(
                child: Text(
                  '입력완료',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
