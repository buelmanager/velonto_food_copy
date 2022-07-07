import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final double top;
  final double left;
  final double popupWidth;
  final double popupHeight;
  final Color background;
  final List<Widget> list;
  final Widget child;
  final BorderRadius borderRadius;
  final bool isDeviceLine;
  final Function whenItemClicked;

  const DropDown({
    Key? key,
    required this.child,
    required this.top,
    required this.left,
    required this.popupWidth,
    required this.popupHeight,
    required this.background,
    required this.list,
    required this.borderRadius,
    required this.isDeviceLine, required this.whenItemClicked,
  }) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('drop clicked');
        showDialog(
          barrierColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Stack(
              children: [
                Positioned(
                  top: widget.top,
                  left: widget.left,
                  child: Container(
                    width: widget.popupWidth,
                    height: widget.popupHeight,
                    decoration: BoxDecoration(
                        color: widget.background,
                        borderRadius: widget.borderRadius),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Visibility(
                          visible: widget.isDeviceLine,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: widget.popupWidth,
                              height: 1,
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: widget.list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                    onTap: (){
                                      widget.whenItemClicked(index);
                                      Navigator.of(context).pop();
                                    },
                                    child: widget.list[index]),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16)
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: widget.child,
    );
  }
}
