import 'package:flutter/material.dart';
import 'categorymodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'categorydetails.dart';
import 'package:flutter_boost/flutter_boost.dart';

class CategoryItem extends StatelessWidget {
  final RankingList category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            new PageRouteBuilder(pageBuilder: (context, _, __) {
          return CategoryDetails(
            categoryId: category.sortId,
            categoryName: category.sortName,
            argCon: category.argCon,
            argName: category.argName,
            argValue: category.argValue,
          );
        }));
        // BoostNavigator.instance.push("categoryPage",withContainer: false,opaque: true);
      },
      child: Container(
        width: ScreenUtil().setWidth((750 - 8) / 3),
        height: ScreenUtil().setWidth((750 - 8) / 3),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Image.network(
                category.cover,
                fit: BoxFit.fill,
              ),
              height: ScreenUtil().setWidth((750 - 8) / 3 - 70),
              width: ScreenUtil().setWidth((750 - 8) / 3),
            ),
            Text(
              category.sortName,
              style: TextStyle(
                  color: Colors.black38, fontSize: ScreenUtil().setSp(28)),
            )
          ],
        ),
      ),
    );
  }
}
