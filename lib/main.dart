import 'package:flutter/material.dart';
import 'package:flutter_sampler/screens/collapsing_toolbar.dart';
import 'package:flutter_sampler/screens/custom_components.dart';
import 'package:flutter_sampler/screens/sticky_header_view.dart';
import 'package:flutter_sampler/screens/test_list_view_rendering.dart';
import 'package:flutter_sampler/widgets/beauty_efect_bottom_sheet_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sampler',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Sampler'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> screens = [
    // TestRenderObject(),
    CollapsingToolbar(),
    StickyHeaderView(),
    CustomComponents(),
    TestListViewRendering()
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This is the call back that get call the after render the UI by build method
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: screens.map((s) {
          return ListTile(
            title: Text(s.runtimeType.toString()),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => screens[screens.indexOf(s)]));
            },
          );
        }).toList()
          ..add(ListTile(
            title: const Text("StateLessBottomSheet"),
            onTap: () {
              _showBeautyBottomSheet();
            },
          )),
      ),
    );
  }

  int _contrast = 0;

  _showBeautyBottomSheet() {
    showModalBottomSheet(
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        isScrollControlled: true,
        backgroundColor: Colors.black87,
        context: context,
        builder: (_) {
          return BeautyEffectBottomSheetWidget(
              defaultContrast: _contrast,
              onBeautyEffectChange:
                  (contrast, smooth, brighten, thinning, eye) {
                _contrast = contrast;
                debugPrint(
                    "===contrast $contrast, smooth $smooth, brighten $brighten, thinning $thinning, eye $eye");
              });
        });
  }
}
