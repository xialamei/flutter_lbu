import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home_swipper.dart';
import 'package:my_flutter/netreqest/netrequest.dart';
import 'package:my_flutter/netreqest/netrequest_url.dart';
import 'home/home_provider.dart';
import 'home/home_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home/home_ListItem.dart';
import 'dart:convert';
import 'package:flutter_boost/flutter_boost.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              HomeSwipper([
                "https://t7.baidu.com/it/u=4071610061,2917123939&fm=193&f=GIF",
                "https://t7.baidu.com/it/u=824649223,881307550&fm=193&f=GIF",
                "https://t7.baidu.com/it/u=4210785492,3843497194&fm=193&f=GIF"
              ]),
              Container(
                color: Colors.black12,
                width: ScreenUtil().setWidth(750),
                height: ScreenUtil().setHeight(1334 - 500 - 60),
                child: FutureBuilder(
                  future: _getRequestData(context),
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      print("数据：");
                      print(HomeProvider().homeModel);
                      HomeModel homeModel =
                          context.watch<HomeProvider>().homeModel;

                      print(homeModel);
                      return _hasDataUI();
                    } else {
                      return Text(
                        "加载中……",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(18)),
                      );
                    }
                  },
                ),
              )
            ],
          ),
          _searchBar(),
        ],
      ),
    );
  }

  ///头部
  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 44),
      child: InkWell(
        onTap: () {
          print("点击搜索");
          var map = {"a":"b"};
          BoostNavigator.instance.pop(map);
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromRGBO(220, 220, 220, 0.4),
            // border: new Border.all(width: 0, color: Colors.white),
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.search), Text("镇魂街")],
          ),
        ),
      ),
    );
  }

  ///内容
  Widget _createList(HomeModel model) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0),
      itemCount: model.data.returnData.comicLists.length,
      itemBuilder: (context, index) {
        return HomeListItem(model.data.returnData.comicLists[index]);
      },
    );
  }

  ///请求数据
  Future _getRequestData(BuildContext context) async {
    await requestGet(requestPath["recommendUrl"]).then((value) {
      try {


        Map<String, dynamic> json = jsonDecode(value);
        print("json解析完成");
        HomeModel homeModel = HomeModel.fromJson(json);
        // context.read<HomeProvider>().getHomeData(homeModel);
        Provider.of<HomeProvider>(context, listen: false)
            .getHomeData(homeModel);
      } catch (e) {
        print("错误${e}");
      }
    });
    return "end";
  }

  Widget _hasDataUI() {
    return Consumer<HomeProvider>(builder: (context, homeData, child) {
      print("provide的数据${homeData.homeModel}");
      return _createList(homeData.homeModel);
    });
  }
}
