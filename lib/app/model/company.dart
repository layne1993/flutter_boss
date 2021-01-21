import 'dart:convert';
import 'package:meta/meta.dart';

class Company {
  final String logo;
  final String name;
  final String location;
  final String type;
  final String size;
  final String employee;
  final String hot;
  final String count;
  final String inc;

  Company({
    @required this.logo,
    @required this.name,
    @required this.location,
    @required this.type,
    @required this.size,
    @required this.employee,
    @required this.hot,
    @required this.count,
    @required this.inc,
  });

  static List<Company> fromJson(String json) {
    List<Company> _companies = [];
    JsonDecoder decoder = new JsonDecoder();
    var mapData = decoder.convert(json)['list'];
    mapData.forEach((obj) {
      Company company = new Company(
        logo: obj['logo'],
        name: obj['name'],
        location: obj['location'],
        type: obj['type'],
        size: obj['size'],
        employee: obj['employee'],
        hot: obj['hot'],
        count: obj['count'],
        inc: obj['inc'],
      );
      _companies.add(company);
    });
    return _companies;
  }
}
