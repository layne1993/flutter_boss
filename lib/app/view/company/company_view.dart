import 'package:flutter/material.dart';
import 'package:flutter_boss/app/item/companyList_item.dart';
import 'package:flutter_boss/app/model/company.dart';
import 'package:flutter_boss/app/view/company/company_detail.dart';

const _kCompanyList = '{"list": [{"logo": "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg", "name": "杭州蚂蚁金服信息技术有限公司", "location": "上海市浦东新区", "type": "互联网", "size": "B轮", "employee": "10000人以上", "hot": "资深开发工程师", "count": "500", "inc": "蚂蚁金服服务集团（以下称蚂蚁金服）起步于2004年成立的支付宝，2014年10月，蚂蚁金服正式成立。"}]}';

class CompanyTab extends StatefulWidget {
  @override
  CompanyList createState() => new CompanyList();
}

class CompanyList extends State<CompanyTab> {
  List<Company> _companies = [];

  @override
  void initState() {
    super.initState();
    getCompanyList();
  }

  void getCompanyList() {
    setState(() {
      _companies = Company.fromJson(_kCompanyList);
    });
  }

  navCompanyDetail(Company company, int index) {
    Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new CompanyDetail(company);
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return new FadeTransition(
          opacity: animation,
          child: new SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      }
    ));
  }

  Widget buildCompanyItem(BuildContext context, int index) {
    Company company = _companies[index];
    var companyItem = new InkWell(
      onTap: () => navCompanyDetail(company, index),
      child: new CompanyListItem(company),
    );
    return companyItem;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(
          '公  司',
          style: new TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: new ListView.builder(
        itemCount: _companies.length,
        itemBuilder: buildCompanyItem,
      ),
    );
  }
}
