

import 'package:flutter/material.dart';
import 'package:flutter_boost/boost_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_model.dart';

import 'package:my_flutter/page/category.dart';

class HomeListItem extends StatelessWidget {
  final ComicLists model;

  HomeListItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: _gridView(),
          width: ScreenUtil().setWidth(750),
         height: ScreenUtil().setHeight(600),
        ),
      ],
    );
  }

  Widget _header() {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      padding: EdgeInsets.all(0),
      child: Row(
        children: [
          Image.network(model.newTitleIconUrl),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Container(
              width: ScreenUtil().setWidth(750 - 180),
              child: Text(
                model.itemTitle,
                style: TextStyle(
                    color: Colors.black87, fontSize: ScreenUtil().setSp(28)),
              ),
            ),
          ),
          InkWell(
            ///更多
            onTap: () {

            },
            child: Icon(
              Icons.more_horiz,
              color: Colors.black26,
            ),
          )
        ],
      ),
    );
  }

  Widget _gridItem(Comics item) {
    return InkWell(
      onTap: (){
       // BoostNavigator.instance.push("categoryPage",withContainer: true,opaque: true);

      },
      child: Container(
        color: Colors.white,
        width: ScreenUtil().setWidth(374),
        height: ScreenUtil().setHeight(300),
        child: Column(
          children: [
            Container(
              child: Image.network(item.cover, fit: BoxFit.fitWidth),
              width: ScreenUtil().setWidth(370),
              height: ScreenUtil().setHeight(200),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              width: ScreenUtil().setWidth(370),
              // height: ScreenUtil().setHeight(50),
              child: Text(
                item.name,
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(370),
              // height: ScreenUtil().setHeight(50),
              padding: EdgeInsets.only(left: 10),
              child: Text(
                item.subTitle,
                style: TextStyle(color: Colors.black38),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _gridView() {
    if (model.comics == null || model.comics.length == 0) {
      return Container();
    } else {
      return GridView.builder(

         physics: NeverScrollableScrollPhysics(), ///禁止滚动
          padding: EdgeInsets.only(top: 0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 1),
          itemCount: model.comics.length,
          itemBuilder: (context, index) {
            return _gridItem(model.comics[index]);
          });
    }
  }
}
