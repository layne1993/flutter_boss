import 'package:flutter/material.dart';

class MineTab extends StatelessWidget{
  final double _appBarHeight = 150.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight,
            flexibleSpace: new FlexibleSpaceBar(
              background: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  const DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: const Alignment(0.0, -1.0),
                          end: const Alignment(0.0, -0.4),
                          colors: const <Color>[const Color(0x00000000), const Color(0x00000000)],
                        )
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          left: 30.0,
                          right: 20.0,
                        ),
                        child: new CircleAvatar(
                          radius: 35.0,
                          backgroundImage: new NetworkImage('https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4260706319,2257405356&fm=85&app=63&f=JPG?w=121&h=75&s=CFC59342F4A2B8BEBEBB445B0300C09A'),
                        ),
                      ),
                      new Row(
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Padding(
                                padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,),
                                //圆形头像
                                child: new Text(
                                  '哆啦a梦',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  )
                                ),
                              ),
                              new Text(
                                '在职-考虑机会',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                )
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          new SliverList(
            delegate: new SliverChildListDelegate(
              <Widget>[
                new Container(
                  color: Colors.white,
                  child: new Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new _ContactItem(
                          onPressed: (){
                            showDialog(
                              context: context,
                              child: new AlertDialog(
                                content: new Text(
                                  '沟通过',
                                  style: new TextStyle(fontSize: 20.0)
                                ),
                              )
                            );
                          },
                          count: '590',
                          title: '沟通过',
                        ),

                        new _ContactItem(
                          onPressed: (){
                            showDialog(
                              context: context,
                              child: new AlertDialog(
                                content: new Text(
                                  '已沟通',
                                  style: new TextStyle(fontSize: 20.0),
                                ),
                              )
                            );
                          },
                          count: '71',
                          title: '已沟通',
                        ),

                        new _ContactItem(
                          onPressed: (){
                            showDialog(
                              context: context,
                              child: new AlertDialog(
                                content: new Text(
                                  '待面试',
                                  style: new TextStyle(fontSize: 20.0),
                                ),
                              )
                            );
                          },
                          count: '0',
                          title: '待面试',
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///沟通信息
class _ContactItem extends StatelessWidget{
  _ContactItem({
    Key key,
    this.count,
    this.title,
    this.onPressed
  }):super(key: key);

  final String count;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    //有个按下的效果
    return new GestureDetector(
      onTap: onPressed,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: new Text(
              count,
              style: new TextStyle(fontSize: 22.0)
            ),
          ),
          new Text(title),
        ],
      ),
    );
  }
}