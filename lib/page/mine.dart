import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key  key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow,);
  }



  Widget _listTile(String title,IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width:  1,color: Colors.black12),

        ),

      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
}
