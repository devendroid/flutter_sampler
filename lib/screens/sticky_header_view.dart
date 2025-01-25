import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

// https://medium.com/@kadriyemacit/sticky-header-at-flutter-74ada6120695

class StickyHeaderView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.runtimeType.toString()),
      ),
      backgroundColor: Colors.pink.shade100,
      body: ListView(
        controller: _scrollController,
        children: [
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 16.0),
             alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            color: Colors.blue,
            child: Text("Top view1"),
          ),

          StickyHeader(
            controller: _scrollController,
            header:
            Padding(
              padding: const EdgeInsets.only(top:48.0, left: 16, right: 16, bottom: 16),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 60,
                color: Colors.green,
                child: Text("Sticky Header"),
              ),
            ),
            content:  const ListCard(),
          )
        ],
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Row(
            children: [
              Image.network("https://picsum.photos/200"),
              const SizedBox(
                width: 20,
              ),
              const Expanded(
                child: Text(
                  "Every city is good for travel.",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
