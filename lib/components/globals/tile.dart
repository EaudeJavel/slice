// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sliceapp/slice_theme.dart';

class CustomTile extends StatefulWidget {
  final Widget icon;
  final String tileTitle;

  const CustomTile({Key? key, required this.icon, required this.tileTitle})
      : super(key: key);

  @override
  _CustomTile createState() => new _CustomTile();
}

class _CustomTile extends State<CustomTile> {
  bool _isButtonDisabled = false;

  void _buttonChange() {
    setState(() {
      _isButtonDisabled = !_isButtonDisabled;
    });
  }

  void _resetButton() {
    setState(() {
      _isButtonDisabled = !_isButtonDisabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xFFC6C5B2),
                spreadRadius: 0,
                offset: Offset(0, 1)),
          ],
        ),
        child: InkWell(
          splashColor: Colors.yellow.withAlpha(30),
          onTap: () {
            _isButtonDisabled ? _resetButton : _buttonChange;
            print(_isButtonDisabled);
          },
          child: ListTile(
            tileColor: Colors.yellow[50],
            leading: widget.icon,
            title: Text(widget.tileTitle),
          ),
        ),
      ),
    );
  }
}
