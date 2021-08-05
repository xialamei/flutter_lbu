import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/netreqest/netrequest_url.dart';
import 'package:my_flutter/netreqest/netrequest.dart';
import 'dart:convert';
import 'categoryDetailModel.dart';
import 'package:provider/provider.dart';
import 'categoryprovider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:my_flutter/page/details/details.dart';
import 'package:my_flutter/page/details/detail_page2.dart';

class CategoryDetails extends StatelessWidget {
  final int argCon;

  final String argName;

  final int argValue;

  final String categoryName;
  final int categoryId;

  CategoryDetails(
      {this.categoryId,
      this.categoryName,
      this.argCon,
      this.argName,
      this.argValue});

  int page = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.categoryName),
      ),
      body: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {
    return FutureBuilder(
      future: _getData(context),
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          return Container(
            child: _createList(),
          );
        } else {
          return Text("正在加载中……");
        }
      },
    );
  }

  Future _getData(BuildContext context) async {
    var params = {
      "argCon": argCon,
      "argName": argName,
      "argValue": argValue,
      "page": page,
    };

    await requestGet(requestPath['categoryDetailUrl'], params: params)
        .then((value) {
      var json = jsonDecode(value.toString());
      print(json);

      CategoryDetailModel model = CategoryDetailModel.fromJson(json);

      if (page == 1) {
        if (model.data.returnData.comics.length > 2) {
          model.data.returnData.comics[0].vipIcon = "lib/images/rankf.png";
          model.data.returnData.comics[1].vipIcon = "lib/images/ranks.png";
          model.data.returnData.comics[2].vipIcon = "lib/images/rankt.png";
        } else if (model.data.returnData.comics.length == 2) {
          model.data.returnData.comics[0].vipIcon = "lib/images/rankf.png";
          model.data.returnData.comics[1].vipIcon = "lib/images/ranks.png";
        } else if (model.data.returnData.comics.length == 1) {
          model.data.returnData.comics[0].vipIcon = "lib/images/rankf.png";
        }

        Provider.of<CategoryProvider>(context, listen: false).getDetails(model);

      }else {
        CategoryDetailModel list =  context.read<CategoryProvider>().details;
        if(model.data.returnData != null && model.data.returnData.comics != null && model.data.returnData.comics.isNotEmpty
        ) {
          list.data.returnData.comics.addAll(model.data.returnData.comics);
        }
        Provider.of<CategoryProvider>(context, listen: false).getDetails(list);
      }




      return "";
    });
    return "";
  }

  Widget _createList() {
    return Consumer<CategoryProvider>(builder: (context, detail, child) {
      return EasyRefresh(
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              height: 1,
              color: Colors.black38,
            );
          },
          itemCount: detail.details.data.returnData.comics.length,
          itemBuilder: (context, index) {
            return _listItem( context,detail.details.data.returnData.comics[index]);
          }),
        onRefresh: (){
          page = 1;
          _getData(context);
        },
        onLoad: ()async{
          page = page + 1;
          _getData(context);
      },
      );
    });
  }

  Widget _listItem(BuildContext context, Comics item) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            new PageRouteBuilder(pageBuilder: (context, _, __) {
              return DetailsPage(
               item.comicId
              );
            }));
      },
      child:  Container(
        padding: EdgeInsets.only(left: 10, bottom: 0),
        color: Colors.white,
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(260),
        child: Row(
          children: [
            Container(
              child: Image.network(
                item.cover,
                fit: BoxFit.fill,
              ),
              width: ScreenUtil().setWidth(220),
              height: ScreenUtil().setHeight(230),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: ScreenUtil().setWidth(750 - 260),
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    item.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black87, fontSize: ScreenUtil().setSp(30)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  width: ScreenUtil().setWidth(750 - 260),
                  child: Text(
                    item.tags.toString() + " | " + item.author,
                    style: TextStyle(
                        color: Colors.black45, fontSize: ScreenUtil().setSp(28)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  width: ScreenUtil().setWidth(750 - 260),
                  child: Text(
                    item.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black45, fontSize: ScreenUtil().setSp(28)),
                  ),
                ),
                _createVipIcon(item),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _createVipIcon(Comics item) {
     if( item.vipIcon != null && item.vipIcon.isNotEmpty) {
       return Container(
           alignment: Alignment.bottomRight,
           margin: EdgeInsets.only(bottom: 0, right: 10),
           width: ScreenUtil().setWidth(750 - 260),
           height: ScreenUtil().setHeight(50),
           child: Image.asset(
             item.vipIcon,
             width: ScreenUtil().setWidth(50),
             height: ScreenUtil().setHeight(50),
           ));
     }else {
       return Container();
     }
  }
}
