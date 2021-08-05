import 'package:flutter/material.dart';
import 'package:flutter_boost/boost_flutter_binding.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'page/home.dart';
import 'page/category.dart';
import 'page/bookstore.dart';
import 'page/mine.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'page/home/home_provider.dart';
import 'page/category/categoryprovider.dart';
import 'provide/details_provider.dart';
import 'page/category/categorydetails.dart';

class CustomFlutterBinding extends WidgetsFlutterBinding  with  BoostFlutterBinding {

}

void main() {
  //在runApp之前确保BoostFlutterBinding初始化
  CustomFlutterBinding();

  runApp(MultiProvider(
    ///状态管理
    providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => DetailsProvider()),
    ],

    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ///路由表
  static Map<String, FlutterBoostRouteFactory> routerMap = {
    'homePage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) {
            return LBUHomePage();
          });
    },
    'categoryPage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          // pageBuilder: (_, __, ___) => SimplePage(
          //   data: settings.arguments,
          // ));
          pageBuilder: (_, __, ___) {
            return MinePage();
          });
    },


    'categroyDetails': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => MinePage(

          ));

    },
  };

  Route<dynamic> routeFactory(RouteSettings settings, String uniqueId) {


   FlutterBoostRouteFactory func = routerMap["homePage"]; //[settings.name];
   //  FlutterBoostRouteFactory func = routerMap[settings.name];

    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(routeFactory);
  }

  // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       //primaryColor: Colors.green,
  //       primaryColor: Colors.green,
  //     ),
  //     home: LBUHomePage(),
  //   );
  // }
}

class LBUHomePage extends StatefulWidget {
  const LBUHomePage({Key key}) : super(key: key);

  @override
  _LBUHomePageState createState() => _LBUHomePageState();
}

class _LBUHomePageState extends State<LBUHomePage> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    BookStorePage(),
    MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(750, 1334),
        orientation: Orientation.portrait);
    return Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_outlined), label: "书架"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        showUnselectedLabels: true,
      ),
      body: Container(
        child: pages[currentIndex],
      ),
    );
  }
}
