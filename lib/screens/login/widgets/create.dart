import 'package:flutter/material.dart';
// import 'package:sliceapp/slice_theme.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() {
    return _CreateScreenState();
  }
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          //`true` if you want Flutter to automatically add Back Button when needed,
          //or `false` if you want to force your own back button every where
          title: Text('Créer mon compte'),
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context, false),
          )
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 45, 10, 10),
        children: <Widget>[
          Container(
            child: 
                Expanded(
                  child :Text('Feature non disponible, contactez les administrateurs',
                    style: Theme.of(context).textTheme.bodyText1
                  )
                )
          )
        ],
      )
    );
  }
}
