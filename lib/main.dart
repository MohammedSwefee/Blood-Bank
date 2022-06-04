
//import 'package:flutter/material.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or simply save your changes to "hot reload" in a Flutter IDE).
//        // Notice that the counter didn't reset back to zero; the application
//        // is not restarted.
//        primarySwatch: Colors.blue,
//        // This makes the visual density adapt to the platform that you run
//        // the app on. For desktop platforms, the controls will be smaller and
//        // closer together (more dense) than on mobile platforms.
//        visualDensity: VisualDensity.adaptivePlatformDensity,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//      ),
//      body: Center(
//        // Center is a layout widget. It takes a single child and positions it
//        // in the middle of the parent.
//        child: Column(
//          // Column is also a layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug painting" (press "p" in the console, choose the
//          // "Toggle Debug Paint" action from the Flutter Inspector in Android
//          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//          // to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:bloodbank/direct_select_container.dart';

import 'direct_select_item.dart';
import 'direct_select_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var t = Text("بنك الدم العراقي");
    return MaterialApp(
      title: "بنك الدم العراقي",

      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      home: MyHomePage(title: 'بنك الدم العراقي'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  List<String> _foodVariants = [

    "الكل",
    "بغداد",
    "البصرة",
    "ذي قار",
    "ديالى",
    "دهوك",
    "أربيل",
    "كربلاء",
    "كركوك",
    "ميسان",
    "المثنى",
    "النجف",
    "نينوى",
    "القادسية",
    "صلاح الدين",
    "السليمانية",
    "واسط",
    "الأنبار",
    "بابل"

  ];

  List<String> _portionSize = [

    "الكل",
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-"
  ];


  int selectedFoodVariants = 0;
  int selectedPortionSize = 0;

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  _getDslDecoration() {
//    return BoxDecoration(
//      border: BorderDirectional(
//        bottom: BorderSide(width: 1, color: Colors.black12),
//        top: BorderSide(width: 1, color: Colors.black12),
//      ),
//    );
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();


  MotionTabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new MotionTabController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title, textDirection: TextDirection.rtl,),
        ),
        bottomNavigationBar: MotionTabBar(
          tabOneName: "المتبرعين",
          tabTwoName: "البحث",
          tabThreeName: "للتواصل",
          tabOneIcon: Icons.home,
          tabTwoIcon: Icons.search,
          tabThreeIcon: Icons.account_box,
          tabIconColor: Colors.green,
          tabSelectedColor: Colors.red,
          textStyle: TextStyle(color: Colors.red),
          onTabItemSelected: (int value){
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              child: Center(
                child: Text("Home"),
              ),
            ),
            Container(

              child: Column(
                children: <Widget>[
                  //Image.asset('blood_bank/lib/backgr.png'),
                  //Image(image: AssetImage('assets/images/backgr.jpeg')),
                  //Image.asset('images/backgr.png'),

                  Container(
                    child: Image.asset(
                        "assets/images/backgr.jepg"),
                  ),
                  Center(
                    child:   DirectSelectContainer(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            verticalDirection: VerticalDirection.down,
                            children: <Widget>[

                              SizedBox(height: 5.0),
                              //_getFoodContainsRow(),

                              SizedBox(height: 20.0),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[

                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      child: Container(
                                        decoration: _getShadowDecoration(),
                                        child: Card(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Expanded(
                                                    child: Padding(
                                                        child: DirectSelectList<String>(
                                                            values: _foodVariants,
                                                            onUserTappedListener: () {
                                                              _showScaffold();
                                                            },
                                                            defaultItemIndex:
                                                            selectedFoodVariants,
                                                            itemBuilder: (String value) =>
                                                                getDropDownMenuItem(value),
                                                            focusedItemDecoration:
                                                            _getDslDecoration(),
                                                            onItemSelectedListener:
                                                                (item, index, context) {
                                                              setState(() {
                                                                selectedFoodVariants = index;
                                                              });
                                                            }),
                                                        padding: EdgeInsets.only(left: 22))),
                                                Padding(
                                                  padding: EdgeInsets.only(right: 8),
                                                  child: _getDropdownIcon(),
                                                )
                                              ],
                                            )),
                                      ),
                                    ),
                                    SizedBox(height: 15.0),

                                    Row(children: <Widget>[
//
                                      Expanded(
                                          flex: 8,
                                          child: Container(
                                            decoration: _getShadowDecoration(),
                                            child: Card(
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: <Widget>[
                                                    Expanded(
                                                        child: Padding(
                                                            child: DirectSelectList<String>(
                                                                values: _portionSize,
                                                                defaultItemIndex:
                                                                selectedPortionSize,
                                                                itemBuilder: (String value) =>
                                                                    getDropDownMenuItem(
                                                                        value),
                                                                focusedItemDecoration:
                                                                _getDslDecoration(),
                                                                onItemSelectedListener:
                                                                    (item, index, context) {
                                                                  setState(() {
                                                                    selectedPortionSize =
                                                                        index;
                                                                  });
                                                                }),
                                                            padding: EdgeInsets.only(
                                                                left: 22))),
                                                    Padding(
                                                      padding: EdgeInsets.only(right: 8),
                                                      child: _getDropdownIcon(),
                                                    )
                                                  ],
                                                )),
                                          )),
                                    ]),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                child: Text("Account"),
              ),
            ),
          ],
        )
    );
  }

  void _showScaffold() {
    final snackBar = SnackBar(content: Text('Hold and drag instead of tap'));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Icon _getDropdownIcon() {
    return Icon(
      Icons.unfold_more,
      color: Colors.blueAccent,
    );
  }

  BoxDecoration _getShadowDecoration() {
    return BoxDecoration(
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black.withOpacity(0.06),
          spreadRadius: 4,
          offset: new Offset(0.0, 0.0),
          blurRadius: 15.0,
        ),
      ],
    );
  }
}
