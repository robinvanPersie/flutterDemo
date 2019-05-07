import 'package:flutter/material.dart';

class EPLWidget extends StatefulWidget {

  @override
  _EPLWidgetState createState() => new _EPLWidgetState();
}

class _EPLWidgetState extends State<EPLWidget> {

  List<int> list;
  List<ExpandState> expandStateList;

  _EPLWidgetState() {
    list = new List();
    expandStateList = new List();
    for (int i = 0; i < 10; i++) {
      list.add(i);
      expandStateList.add(ExpandState(false, i));
    }
  }

  _setCurrentIndex(int index, bool isExpanded) {
    setState(() {
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpanded;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('expansion list appbar'),),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, boolean) {
            _setCurrentIndex(index, boolean);
          },
          children: list.map((index) {
            return ExpansionPanel(
                headerBuilder: (ctx, isExpanded) {
                  return ListTile(
                    title: Text('this is No.$index'),
                  );
                },
                body: ListTile(
                  title: Text('expansion no.$index'),
                ),
              isExpanded: expandStateList[index].isOpen,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ExpandState {
  var isOpen;
  var index;
  ExpandState(this.isOpen, this.index);
}