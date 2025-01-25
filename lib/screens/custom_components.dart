import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomComponents extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomComponentsState();
}

class _CustomComponentsState extends State<CustomComponents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.runtimeType.toString()),
      ),
      body: SafeArea(
          child:
          Column(
            children: [
              SizedBox(height: 16,),
              Center(child: myButton()),
              Expanded(child: Container(alignment: Alignment.bottomCenter, child: ExpandableContainer())),
            ],
          )
      ),
    );
  }
}

class ExpandableContainer extends StatefulWidget {
  bool isExpanded;

  ExpandableContainer({this.isExpanded = false});

  @override
  State<StatefulWidget> createState() => _ExpandableContainer();
}

class _ExpandableContainer extends State<ExpandableContainer> {
  bool isContainerExpanded = false;

  @override
  void initState() {
    super.initState();
    isContainerExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: isContainerExpanded ? null : 200,
        margin: EdgeInsets.all(16.0),
        padding:
            EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.green[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: isContainerExpanded
                    ? null
                    : const NeverScrollableScrollPhysics(),
                child: Text(
                  // Your scrollable text goes here
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." +
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." +
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." +
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." +
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                  style: TextStyle(fontSize: 26.0),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    isContainerExpanded = !isContainerExpanded;
                  });
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(isContainerExpanded ? "Read Less" : "Read More",
                      style: TextStyle(fontSize: 16.0, color: Colors.red)),
                )),
            ElevatedButton(onPressed: () {}, child: Text("Button")),

          ],
        ),
      );
  }
}

Widget myButton() {
  return  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black.withOpacity(.25),
          blurRadius: 4.0,
          spreadRadius: 0,
          offset: Offset(0, 4.0),
        ),
      ],
    ),
    margin: EdgeInsets.symmetric(horizontal: 16),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        // Button pressed action
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: 0.0,
        // Shadow elevation
        //  shadowColor: Colors.black26,
        // Shadow color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 15.0), // Padding inside the button
      ),
      child: Text('ElevatedButton with Decoration',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(.25),
              offset: Offset(0, 4),
              blurRadius: 4.0,
            ),
          ],
        ),),
    ),
  );
}


