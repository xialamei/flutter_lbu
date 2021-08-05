import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category/categoryItem.dart';
import 'package:my_flutter/netreqest/netrequest_url.dart';
import 'package:my_flutter/netreqest/netrequest.dart';
import 'category/categorymodel.dart';
import 'category/categoryprovider.dart';
import 'dart:convert';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('分类'),
      ),
      body: Container(
        margin: EdgeInsets.all(2),
        child: FutureBuilder(
          future: _getData(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return _hasDataUI();
            } else {
              return Text("正在加载中……");
            }
          },
        ),
      ),
    );
  }

  Widget _hasDataUI() {
    return Consumer<CategoryProvider>(builder: (context, category, child) {
      return _gridView(category.category.data.returnData.rankingList);
    });
  }

  Widget _gridView(List<RankingList> categorys) {
    return GridView.builder(
        itemCount: categorys.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemBuilder: (context, index) {
          return CategoryItem(categorys[index]);
        });
  }

  Future _getData() async {
    await requestGet(requestPath['categoryURl']).then((value) {
      try {
        var json = jsonDecode(value.toString());
        CategoryModel categoryModel = CategoryModel.fromJson(json);

        Provider.of<CategoryProvider>(context, listen: false)
            .getCategory(categoryModel);
        return '';
      } catch (e) {
        print("分类出错了：${e}");
        return '';
      }
    });
    return '';
  }
}
