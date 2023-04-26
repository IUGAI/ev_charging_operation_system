import 'package:flutter/material.dart';

class FindPhoneSuccess extends StatefulWidget {
  const FindPhoneSuccess({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<FindPhoneSuccess> createState() => _FindPhoneSuccessState();
}


class _FindPhoneSuccessState extends State<FindPhoneSuccess> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
