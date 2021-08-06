import 'package:flutter/material.dart';
import 'package:my_flutter/page/details/details_page1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'detail_page2.dart';
import 'package:provider/provider.dart';
import 'detailheader.dart';
import 'package:my_flutter/netreqest/netrequest_url.dart';
import 'package:my_flutter/netreqest/netrequest.dart';
import 'dart:convert';
import 'detailmodel.dart';
import 'package:my_flutter/provide/details_provider.dart';
import 'guesslike.dart';

class DetailsPage extends StatefulWidget {
  final int commicId;
  DetailsPage(this.commicId);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}


class _DetailsPageState extends State<DetailsPage>  with SingleTickerProviderStateMixin{

  TabController tabController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    getPage1(context);

    return Scaffold(

      body: FutureBuilder(
        future: _getDetails(context),
        builder: (context,snapShot){
          if(snapShot.hasData) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(

                  //是否随着滑动隐藏标题
                  floating: true,
                  //是否固定在顶部
                  pinned: true,
                  elevation: 0,
                  expandedHeight: ScreenUtil().setHeight(330),
                  flexibleSpace: FlexibleSpaceBar(
                    // title: Text('Sliver-sticky效果'),
                    background:  header(context ),
                  ),

                 automaticallyImplyLeading: true,
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: StickyTabBarDelegate(
                    child: TabBar(

                      labelColor: Colors.green,
                      indicatorColor: Colors.green,
                      unselectedLabelColor: Colors.black87,
                      controller: this.tabController,
                      indicatorSize:TabBarIndicatorSize.label,

                      tabs: <Widget>[
                        Tab(text: '详情'),
                        Tab(text: '目录'),
                        Tab(text: '评论'),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    controller: this.tabController,
                    children: <Widget>[
                    //  Center(child: Text('Content of Home')),
                      page1(context),
                      page2(context),
                      Center(child: Text('Content of Profile')),


                    ],
                  ),
                ),
              ],
            );
          }else {
            return Text("正在加载中……");
          }
        },
      ),

    );
  }

  Widget header(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context, detail, child) {
      return DetailHeader(detail.comic);
    });
  }

  Widget page1(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context, detail, child) {
      return DetailsPage1(detail.comic,detail.others,detail.guessLike);
    });
  }

  Widget page2(BuildContext context) {
     return Consumer<DetailsProvider>(builder: (context, detail, child) {
      return DetailPage2();
      });
  }

  Widget tab(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.green,
      labelColor: Colors.green,
      unselectedLabelColor: Colors.black87,
      indicatorSize: TabBarIndicatorSize.label,
      isScrollable: false,
      tabs: [
        new Tab(
          text: "详情",
        ),
        new Tab(
          text: "目录",
        ),
        new Tab(
          text: "评论",
        ),
      ],
    );
  }

  Future getPage1(BuildContext context) async {
    await _getDetails(context);
    await _getReal(context);
    await _getGuessLike(context);
    return "";
  }

  Future _getDetails(BuildContext context) async {
    var parmas = {"comicid": this.widget.commicId};
    await requestGet(requestPath['detailsUrl'], params: parmas).then((value) {
      var json = jsonDecode(value.toString());
      DetailsModel model = DetailsModel.fromJson(json['data']);
      Provider.of<DetailsProvider>(context, listen: false)
          .getDetailsModel(model);
      print(model.toJson());
      return "";
    });
    return "";
  }

  Future _getReal(BuildContext context) async {
    var parmas = {"comicid": this.widget.commicId};
    await requestGet(requestPath['detailRealUrl'], params: parmas)
        .then((value) {
      var json = jsonDecode(value.toString());
    });
    return "";
  }

  Future _getGuessLike(BuildContext context) async {
    await requestGet(requestPath['guessUrl'])
        .then((value) {
      var json = jsonDecode(value.toString());
      List<Comic> comicsList = [];
      var jsonList = json["data"]["returnData"]["comics"];
      jsonList.forEach((v) {
        comicsList.add(new Comic.fromJson(v));
      });
      Provider.of<DetailsProvider>(context,listen: false).getGuessLike(comicsList);
    });
    return "";
  }
}


class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}