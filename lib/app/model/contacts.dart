import 'dart:convert';
import 'package:meta/meta.dart';

class Contacts {
  final String name;
  final String avatar;
  final String company;
  final String position;
  final String msg;

  Contacts({
    @required this.name,
    @required this.avatar,
    @required this.company,
    @required this.position,
    @required this.msg,
  });

  static List<Contacts> fromJson(String json) {
    List<Contacts> _contacts = [];
    JsonDecoder decoder = new JsonDecoder();
    var mapData = decoder.convert(json)['list'];
    mapData.forEach((obj) {
      Contacts jo = new Contacts(
        name: obj['name'],
        avatar: obj['avatar'],
        company: obj['company'],
        position: obj['position'],
        msg: obj['msg'],
      );
      _contacts.add(jo);
    });
    return _contacts;
  }
}