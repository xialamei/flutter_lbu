import 'package:dio/dio.dart';
import 'dart:async';

Future requestGet(String url, {dynamic params}) async {
  Dio dio = Dio();
  dio.options = BaseOptions(
      responseType: ResponseType.plain
  );
  try {
    Response response;
    if (params == null) {


      response = await dio.get(url).then((value) {
        print(value);
        return value;
      });
      // print(response.data);
      return response.data;
    } else {
      response = await dio.get(url, queryParameters: params).then((value) {
        return value;
      }

      );
      return response.data;
    }
  } catch (e) {
    print("错误+${e}");
    return print(e);
  }
}
