import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:my_flutter/provide/details_provider.dart';
import 'package:provider/provider.dart';
import 'detailmodel.dart';
import 'package:my_flutter/netreqest/netrequest.dart';
import 'package:my_flutter/netreqest/netrequest_url.dart';
import 'dart:convert';
import 'scanmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter/provide/scan_provider.dart';

class DetailScan extends StatelessWidget {
  var chapterNum = 0;
  var list = List<ImageListModel>();
  final chapter_id;

  DetailScan(this.chapter_id);

  @override
  Widget build(BuildContext context) {
    var chapters = context.watch<DetailsProvider>().chapters;
    ChapterList list = chapters[chapterNum];
    return Scaffold(
      appBar: ScanApp(),
      body: GestureDetector(
        onTap: () {
          bool show = Provider.of<ScanProvider>(context, listen: false).showAppbar;
          Provider.of<ScanProvider>(context, listen: false).setShowAppbar(show);
        },
        child: Container(
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(1334),
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return _createList();
              } else {
                return Text('正在加载中~');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _createList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 10, left: 0),
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setWidth(double.parse(list[index].height) /
              double.parse(list[index].width) *
              750),
          child: Image.network(
            list[index].location,
            fit: BoxFit.fill,
          ),
        );
      },
      itemCount: list.length,
    );
  }

  Future getData() async {
    await requestGet(requestPath['chapter'], params: {"chapter_id": chapter_id})
        .then((value) {
      var json = jsonDecode(value.toString());
      print(json);
      var scanModel = ScanModel.fromJson(json);
      list = scanModel.data.returnData.imageList;
      print(list);
    });
    return "";
  }

  Widget _getAppbar() {
    return Consumer<ScanProvider>(builder: (context, detail, child) {
      if (detail.showAppbar) {
        return AppBar();
      } else {
        return SizedBox();
      }
    });
  }

}

class ScanApp  extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => const Size.fromHeight(50);
  Widget build(BuildContext context) {
    // var show =  context.read<ScanProvider>().showAppbar;
   var   show = Provider.of<ScanProvider>(context).showAppbar;
    // if (show) {
    //   return AppBar();
    // }else {
    //   return SizedBox();
    // }
   // return AppBar();
    return Consumer<ScanProvider>(builder: (context, detail, child) {
      if (detail.showAppbar) {
        return AppBar(title: Text("has"),);
      } else {
        return AppBar(title: Text("null"),);
      }
    });


  }

}