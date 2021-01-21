import 'package:flutter/material.dart';
import 'package:flutter_boss/app/model/company.dart';
import 'package:flutter_boss/app/component/indicator_viewpager.dart';
import 'package:flutter_boss/app/view/company/company_hot_job.dart';
import 'package:flutter_boss/app/view/company/company_inc.dart';
import 'package:flutter_boss/app/view/company/company_info.dart';

const double _kAppBarHeight = 256.0;

class CompanyDetail extends StatefulWidget {
  final Company _company;
  CompanyDetail(this._company);

  @override
  CompanyDetailState createState() => new CompanyDetailState();
}

class CompanyDetailState extends State<CompanyDetail> with TickerProviderStateMixin {
  List<Widget> _imagePages;
  List<String> _urls = [
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2259875190,965574388&fm=26&gp=0.jpg',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1527680344,641214664&fm=26&gp=0.jpg',
    'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3778084111,3078080579&fm=26&gp=0.jpg',
  ];
  int _currentIndex = 0;
  List<Tab> _tabs;
  TabController _controller;
  Widget _companyTabContent;
  VoidCallback onChanged;

  @override
  void initState() {
    super.initState();
    if (_urls.isNotEmpty) {
      _imagePages = <Widget>[];
      _urls.forEach((String url) {
        _imagePages.add(
          new Container(
            color: Colors.black.withAlpha(900),
            child: new ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: new Image.network(
                url,
                fit: BoxFit.cover,
                height: _kAppBarHeight,
              ),
            ),
          )
        );
      });
    }

    _tabs = [
      new Tab(text: '公司概况'),
      new Tab(text: '热招职位'),
    ];
    _companyTabContent = new CompanyInc(widget._company.inc);
    _controller = new TabController(length: _tabs.length, vsync: this);
    onChanged = () {
      setState(() {
        if (_currentIndex == 0) {
          _companyTabContent = new CompanyInc(widget._company.inc);
        } else {
          _companyTabContent = new CompanyHotJob();
        }
        _currentIndex = this._controller.index;
      });
    };
    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(onChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      body: new Stack(
        children: <Widget>[
          new SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                new SizedBox.fromSize(
                  size: const Size.fromHeight(_kAppBarHeight),
                  child: new IndicatorViewPage(_imagePages),
                ),
                new Container(
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      new CompanyInfo(widget._company),
                      new Divider(),
                      new TabBar(
                        indicatorWeight: 3.0,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: new TextStyle(fontSize: 16.0),
                        labelColor: Colors.black,
                        controller: _controller,
                        tabs: _tabs,
                        indicatorColor: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),
                _companyTabContent,
              ],
            ),
          ),
          new Positioned(
            top: 10.0,
            left: -10.0,
            child: new Container(
              padding: const EdgeInsets.all(15.0),
              child: new BackButton(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}