import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sliceapp/slice_theme.dart';

class CustomClickableTile extends StatefulWidget {
  final String title;
  final String clickedTitle;
  final Widget img;

  const CustomClickableTile({
    Key? key,
    required this.title,
    required this.clickedTitle,
    required this.img,
  }) : super(key: key);

  @override
  _CustomClickableTile createState() => new _CustomClickableTile();
}

class _CustomClickableTile extends State<CustomClickableTile> {
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
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            child: Container(
                height: 70,
                margin: const EdgeInsets.only(bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton.icon(
                    label: new Text(
                      _isButtonDisabled ? widget.clickedTitle : widget.title,
                      style: _isButtonDisabled
                          ? ListViewStyle.headline5(context)
                          : ListViewStyle.headline2(context),
                    ),
                    icon: widget.img,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, //button bg color
                      onPrimary: TextColor,
                      onSurface: Colors.grey, //disable color
                    ),
                    onPressed: _isButtonDisabled ? _resetButton : _buttonChange,
                    
                  ),
                ))),
      ],
    );
  }
}
