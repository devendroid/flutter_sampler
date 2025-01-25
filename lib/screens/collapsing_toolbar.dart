import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollapsingToolbar extends StatefulWidget {
  @override
  _CollapsingToolbarState createState() => _CollapsingToolbarState();
}

class _CollapsingToolbarState extends State<CollapsingToolbar> {


  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: Icon(Icons.arrow_back),
                  actions: [ Icon(Icons.settings)],
                  backgroundColor: Colors.green,
                  expandedHeight: 350.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background:  Container(
                      color: Colors.red,
                      child: Container(
                        child: const Center(
                          child: Text("John Doe"),
                        ),
                      ),
                    ),

                  )
                  // Container(
                  //   color: Colors.red,
                  //   child: const Column(children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 30.0),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //         Icon(Icons.arrow_back),
                  //           Icon(Icons.settings)
                  //       ],),
                  //     ),
                  //     Expanded(
                  //       child: Center(
                  //         child: Text("John Doe"),
                  //       ),
                  //     ),
                  //   ]),
                  // )

                  // FlexibleSpaceBar(
                  //     centerTitle: true,
                  //     title: Text("Collapsing Toolbar",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 16.0,
                  //         )),
                  //     background: Image.network(
                  //       "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  //       fit: BoxFit.cover,
                  //     )),
                  ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                   TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    onTap: (i){
                      setState(() {
                        currentTab = i;
                      });
                    },
                    tabs: [
                      Tab(text: "Tab 1"),
                      Tab(text: "Tab 2"),
                      Tab(text: "Tab 3"),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Center(
            child: Text("Sample text $currentTab"),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
