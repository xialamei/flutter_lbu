import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'detailmodel.dart';

class DetailsPage1 extends StatelessWidget {
  final Comic comic;
  final List<OtherWorks> others;
  final List<Comic> guessLikes;

  DetailsPage1(this.comic, this.others, this.guessLikes);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _createDescribe(),
        _createOther(),
        _createBill(),
        _guessLike(),
      ],
    );
  }

//作品介绍

  Widget _createDescribe() {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '作品介绍',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(30), color: Colors.black87),
          ),
          Container(
            width: ScreenUtil().setWidth(730),
            child: Text(
              comic.description,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28), color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }

//其他作品

  Widget _createOther() {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(200),
            child: Text(
              '其他作品',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30), color: Colors.black87),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: ScreenUtil().setWidth(750 - 270),
            child: Text(
              this.others.length.toString() + "本",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(24), color: Colors.black45),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.grey,
            size: 20,
          ),
        ],
      ),
    );
  }

//本月月票
  Widget _createBill() {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(750),
      color: Colors.white,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: '本月月票 ', style: TextStyle(color: Colors.black45)),
            TextSpan(text: '点击', style: TextStyle(color: Colors.orange)),
            TextSpan(
              text: '  |  ',
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: ScreenUtil().setSp(36),
                  fontWeight: FontWeight.w300),
            ),
            TextSpan(text: '累计月票 ', style: TextStyle(color: Colors.grey)),
            TextSpan(text: '点击 ', style: TextStyle(color: Colors.orange)),
          ],
        ),
      ),
    );
  }

//猜你喜欢
  Widget _guessLike() {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(top: 10, left: 0),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '猜你喜欢',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30), color: Colors.black87),
            ),

          ),
          createLikes(),
        ],
      ),
    );
  }

  Widget createLikes() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setHeight(300),
            child: Column(
              children: [
                Image.network(guessLikes[index].cover,width: ScreenUtil().setWidth(200),),
                Text(
                  guessLikes[index].name,
                  style: TextStyle(color: Colors.black45),
                )
              ],
            ),
          );
        },
        itemCount: guessLikes.length,
      ),

    );
  }
}
