import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../model/UseMultiProvider.dart';
import '../../../postalKorea/remedi_kopo.dart';
import '../../../postalKorea/src/kopo_model.dart';


class FindBlock extends StatelessWidget {
  const FindBlock({Key? key, required this.function}) : super(key: key);
  final Function function;

  @override
  Widget build(BuildContext context) {
    String addressJSON = '';
    final stringprovider = Provider.of<DataMulti>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: ElevatedButton(
        child: Text('검색', style: TextStyle(fontWeight: FontWeight.w900, fontSize:16),),
        onPressed: () {
          function();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          primary: Color(0xff0aaff0),
          onPrimary: Colors.white, // set the text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // set the border radius

          ),
        ),
      ),
    );
  }
}
