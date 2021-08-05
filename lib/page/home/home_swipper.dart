import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSwipper extends StatelessWidget {

  final List list;

  HomeSwipper(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height:ScreenUtil().setHeight(500) ,
      child: Swiper(
        itemCount: list.length,
        itemBuilder: (BuildContext context,int index ){
          return Image.network(list[index],fit: BoxFit.fill,);
        },
        autoplay: true,
        pagination: new SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.black26,
              activeColor: Colors.lightGreen,
            )
        ),
        // indicatorLayout: PageIndicatorLayout.COLOR ,

      ),
    );
  }
}
