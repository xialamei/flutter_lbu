import 'package:flutter/material.dart';
import 'package:my_flutter/page/details/detailheader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'detailmodel.dart';
import 'package:my_flutter/provide/details_provider.dart';
import 'package:provider/provider.dart';
import 'detail_scan.dart';

class DetailPage2 extends StatelessWidget {
  List<ChapterList> chapters;

  //
  // DetailPage2(this.chapters);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // color: Colors.white,
      child: Column(
        children: [
          createHeader(context),
          createGridView(context),
        ],
      ),
    );

  }

  Widget createHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(750 - 110),
            child: Text("目录"),
          ),
          InkWell(
            onTap: () {
              // var list = Provider.of<DetailsProvider>(context,listen: false).chapters;
              var list = context.read<DetailsProvider>().chapters;
              Provider.of<DetailsProvider>(context, listen: false)
                  .setChapts(list.reversed.toList());

              print("点击倒序");
            },
            child: Text("倒序"),
          ),
        ],
      ),
    );
  }

  Widget createGridView(BuildContext context) {
    return Consumer<DetailsProvider>(builder: (context, detail, child) {
      chapters = detail.chapters;
      if (chapters.length == 0) {
        return Text("no data ……");
      }
      return Expanded(
        // width: ScreenUtil().setWidth(750),
        // height: ScreenUtil().setHeight(500),
        // margin: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10,
              childAspectRatio: 73 / 16, //设置宽高比
            ),
            itemCount: chapters.length,
            itemBuilder: (context, index) {
              return InkWell(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  width: ScreenUtil().setWidth(730 / 2),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(chapters[index].name),
                ),
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                    return DetailScan(chapters[index].chapterId);
                  }));
                },
              );
            }),

         );

    });
  }



}



