import 'package:flutter/material.dart';
import 'detailmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuessLike extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(300),
      child: Column(
        children: [
          Text(
            '猜你喜欢',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(26), color: Colors.black87),
          ),
          ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(

                );
              }),
        ],
      ),
    );
  }
}
