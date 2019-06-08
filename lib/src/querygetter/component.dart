import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'items.dart';


@Component(
  selector: 'query-getter',
  styleUrls: ['style.css'],
  templateUrl: 'querygetter.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
    NgFor,
    NgIf,
    MaterialButtonComponent
  ],
)
class QueryGetterComponent  {

  String ip = "";
  String port = "19132";
  
  Items items = new Items();

  void search() {
    runZoned(setQuery, onError: (e) {
      items.single("接続エラーが発生しました");
    });

  }

  void setQuery() async {
    items.single("取得中...");
    await http
        .get("https://api.mcsrvstat.us/1/" + ip + ":" + port)
        .then((http.Response response) {
      String result = utf8.decode(response.bodyBytes);
      Map arr = jsonDecode(result);

      if (arr["offline"] != true) {
        items.init()
        .add("サーバー名：" + arr["motd"]["clean"][0])
        .add("バージョン：" + arr["version"])
        .add("接続人数：" + arr["players"]["online"].toString() + "/" + arr["players"]["max"].toString())
        .add("プレイヤーリスト：");
        arr["players"]["list"].forEach((element) => items.add(" ・"+element));
      } else {
        items.single("サーバーがオフラインです");
      }
    });
  }


}
