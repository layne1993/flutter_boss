import 'package:flutter/material.dart';
import 'package:flutter_boss/app/component/icon_tab.dart';
import 'package:flutter_boss/app/view/jobs_view.dart';
import 'package:flutter_boss/app/view/company/company_view.dart';
import 'package:flutter_boss/app/view/contacts_view.dart';
import 'package:flutter_boss/app/view/mine_view.dart';

const double _kTabTextSize = 11.0;
const int INDEX_JOB = 0;
const int INDEX_COMPANY = 1;
const int INDEX_CONTACTS = 2;
const int INDEX_MINE = 3;
Color _kPrimaryColor = new Color.fromARGB(255, 0, 125, 198);

class MyHomePage extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _controller;
  VoidCallback onChange;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, initialIndex: _currentIndex, length: 4);
    onChange = () {
      setState(() {
        _currentIndex = this._controller.index;
      });
    };

    _controller.addListener(onChange);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: <Widget>[
          new JobsTab(),
          new CompanyTab(),
          new ContactsTab(),
          new MineTab(),
        ],
        controller: _controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: new TextStyle(fontSize: _kTabTextSize),
          tabs: <IconTab>[
            new IconTab(
              icon: _currentIndex == INDEX_JOB ? "images/ic_main_tab_job_pre.png" : "images/ic_main_tab_job_nor.png",
              text: "职位",
              color: _currentIndex == INDEX_JOB ? _kPrimaryColor : Colors.grey[900],
            ),
            new IconTab(
              icon: _currentIndex == INDEX_COMPANY ? "images/ic_main_tab_company_pre.png" : "images/ic_main_tab_company_nor.png",
              text: "公司",
              color: _currentIndex == INDEX_COMPANY ? _kPrimaryColor : Colors.grey[900],
            ),
            new IconTab(
              icon: _currentIndex == INDEX_CONTACTS ? "images/ic_main_tab_contacts_pre.png" : "images/ic_main_tab_contacts_nor.png",
              text: "消息",
              color: _currentIndex == INDEX_CONTACTS ? _kPrimaryColor : Colors.grey[900],
            ),
            new IconTab(
              icon: _currentIndex == INDEX_MINE ? "images/ic_main_tab_my_pre.png" : "images/ic_main_tab_my_nor.png",
              text: "我的",
              color: _currentIndex == INDEX_MINE ? _kPrimaryColor : Colors.grey[900],
            )
          ],
        ),
      ),
    );
  }
}