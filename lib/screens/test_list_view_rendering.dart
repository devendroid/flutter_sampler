import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class TestListViewRendering extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestListViewRenderingState();
}

class _TestListViewRenderingState extends State<TestListViewRendering> {
  List<String> items = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O'];

  void _reverseOrder() {
    setState(() {
      items = items.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.runtimeType.toString()),
      ),
      body: SafeArea(
        child: ListView.builder(
          //addAutomaticKeepAlives: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(items[index]);
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: _reverseOrder,
          child: Text('reverse order'),
        ),
      ),
    );
  }

  Widget _buildItem(String data) {
    return TestProxy(
      key: ValueKey(data),
      child: Container(
        height: 80.0,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide()),
        ),
        child: Center(
          child: Text(data),
        ),
      ),
    );
  }
}

class TestProxy extends SingleChildRenderObjectWidget {
  TestProxy({required Key key, required Widget child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    print('==createRenderObject $key');
    return RenderProxyBox();
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    print('==updateRenderObject $key');
  }

}