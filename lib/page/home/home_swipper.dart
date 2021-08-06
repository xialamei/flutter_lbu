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
          return Hero(tag: index, child: InkWell(
            child: Image.network(list[index],fit: BoxFit.fill,),
            onTap: (){
              Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                return ScanImage(list, index);
              }));
            },
          ));
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



class ScanImage extends StatelessWidget {
  
  final imageUrl;
  final index;
  ScanImage(this.imageUrl,this.index);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:
      InkWell(
          onTap: (){
            Navigator.pop(context);
          },
        child:  Container(
          color: Colors.black,
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(1334),
          alignment: Alignment.center,
            child: Hero(
              tag:index,
              child: Image.network(imageUrl[index],fit: BoxFit.fill,),
            ),
        ),
      ),


    );
  }
}
