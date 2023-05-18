import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:provider/provider.dart';
import '../../../model/UseMultiProvider.dart';

enum Navigators {
  checked,
  notcheked,
}
Navigators checked = Navigators.notcheked;

class TextFieldWidget_Bank_Card_input_x6 extends StatefulWidget {
  const TextFieldWidget_Bank_Card_input_x6({
    Key? key,
    required this.passwordController,
    required this.hintextl,
    required this.isPassword, required this.obscureText
  }) : super(key: key);

  final TextEditingController passwordController;
  final hintextl;
  final bool isPassword;
  final bool obscureText;

  @override
  _TextFieldWidget_CardState createState() => _TextFieldWidget_CardState();
}

class _TextFieldWidget_CardState extends State<TextFieldWidget_Bank_Card_input_x6> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<DataMulti>(context, listen: false);
    // widget.passwordController.text = provider.newvalueofchargecardnumner;
    print(provider.chargeCardNumber);
  }

  @override
  Widget build(BuildContext context) {
    final stringprovider = Provider.of<DataMulti>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Column(
      children: [ Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xff2d3748),
          border: Border.all(
            width: 0,
            color: Color(0xff2d3748),
          ),
        ),
        child: TextField(
          onTap: () {
            print('taped');
            setState(() {
              checked = Navigators.checked;
            });
          },
          controller: widget.passwordController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          style: TextStyle(fontSize: 24),
          autofocus: true,
          showCursor: true,
          readOnly: true,
        ),
      ),
        checked == Navigators.checked
            ? CustomKeyboard(
          onTextInput: (myText) {
            _insertText(myText);
          },
          onCleartext: () {
            widget.passwordController.clear();
          },
          onBackspace: () {
            _backspace();
          },
          onCheckspace: () {
            setState(() {
              checked = Navigators.notcheked;
            });
          },
        )
            : Container()
      ]
    );
  }

  void _insertText(String myText) {
    final text = widget.passwordController.text;
    final textSelection = widget.passwordController.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    widget.passwordController.text = newText;
    widget.passwordController.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = widget.passwordController.text;
    final textSelection = widget.passwordController.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      widget.passwordController.text = newText;
      widget.passwordController.selection = textSelection.copyWith(
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
    widget.passwordController.text = newText;
    widget.passwordController.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  void dispose() {
    widget.passwordController.dispose();
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
      margin: EdgeInsets.only(top: 200),
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
    return Expanded(
      child: Row(
        children: [
          EmptyKey(text: '', onTextInput: _textInputHandler, flex: 1),
          TextKey(
            text: '1',
            onTextInput: _textInputHandler,
            flex: 1,
          ),
          TextKey(text: '9', onTextInput: _textInputHandler, flex: 1),
          TextKey(text: '7', onTextInput: _textInputHandler, flex: 1),
          TextKey(text: '4', onTextInput: _textInputHandler, flex: 1),
          TextKey(text: '5', onTextInput: _textInputHandler, flex: 1),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(text: '6', onTextInput: _textInputHandler, flex: 1),
          TextKey(text: '3', onTextInput: _textInputHandler, flex: 1),
          EmptyKey(text: '', onTextInput: _textInputHandler, flex: 1),
          TextKey(text: '8', onTextInput: _textInputHandler, flex: 1),
          TextKey(text: '2', onTextInput: _textInputHandler, flex: 1),
          TextKey(text: '0', onTextInput: _textInputHandler, flex: 1),
        ],
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
            child: InkWell(
              onTap: () {
                onTextInput?.call(text);
              },
              child: Container(
                child: Center(child: Text(text, style: TextStyle(fontSize: 20),)),
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
            child: InkWell(
              onTap: () {

              },
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
          child: InkWell(
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
          child: InkWell(
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





