import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'detailmodel.dart';

class DetailHeader extends StatelessWidget {
  final Comic comic;

  DetailHeader(this.comic);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(
            comic.wideCover,
            colorBlendMode: BlendMode.clear,
            fit: BoxFit.cover,
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(420),
          ),
          Container(
            ///蒙板
            color: Colors.black26.withOpacity(0.25),
            //Theme.of(context).primaryColor.withOpacity(0.5),
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(420),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 30, top: 100),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.white, width: 1)),
                child: Image.network(
                  comic.cover,
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setHeight(180),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(200),
                      margin: EdgeInsets.only(left: 20, top: 120),
                      height: ScreenUtil().setHeight(40),
                      child: Text(
                        comic.name,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(32),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(300),
                      margin: EdgeInsets.only(left: 20, top: 5),
                      child: Text(
                        comic.author.name,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(26),
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(300),
                      margin: EdgeInsets.only(left: 20, top: 5),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: '点击 ',
                                style: TextStyle(color: Colors.white)),

                            TextSpan(
                                text: '点击',
                                style: TextStyle(color: Colors.orangeAccent)),

                            TextSpan(
                                text: ' 收藏 ',
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                                text: '点击',
                                style: TextStyle(color: Colors.orange)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
