import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../postalKorea/remedi_kopo.dart';
import '../postalKorea/src/kopo_model.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String addressJSON = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remedi Kopo Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: ElevatedButton(
                child: Text('Find Korean Postal Address'),
                onPressed: () async {
                  KopoModel model = await Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Remedicopo(),
                    ),
                  );
                  print(model.toJson());
                  setState(() {
                    addressJSON =
                    '${model.address} ${model.buildingName}${model.apartment == 'Y' ? '아파트' : ''} ${model.zonecode} ';
                  });
                },
              )),
          Text('$addressJSON'),
        ],
      ),
    );
  }
}
