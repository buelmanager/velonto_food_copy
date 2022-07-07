import 'package:flutter/material.dart';
import 'package:velonto_food_copy/core/components/menu/drop_down.dart';

class DropDownMenu extends StatefulWidget {
  final List<String> list;
  final Widget child;
  final Function whenItemClicked;

  const DropDownMenu(
      {Key? key,
      required this.list,
      required this.child,
      required this.whenItemClicked})
      : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return dropDownMenu();
  }

  late List<Widget> dropItems;

  _createItem() {
    List<Widget> temps = [];
    widget.list.forEach((element) {
      temps.add(_mackDropDownItem(element));
    });

    return temps;
  }

  Widget _mackDropDownItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  DropDown dropDownMenu() {
    return DropDown(
      list: _createItem(),
      popupWidth: 200,
      popupHeight: 200,
      background: Colors.grey.shade100,
      top: 35,
      left: 72,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      isDeviceLine: true,
      whenItemClicked: (int index) {
        setState(() {
          widget.whenItemClicked(index);
        });
      },
      child: widget.child,
    );
  }
}
