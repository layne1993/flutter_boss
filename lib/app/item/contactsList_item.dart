import 'package:flutter/material.dart';
import 'package:flutter_boss/app/model/contacts.dart';

class ContactsListItem extends StatelessWidget {
   final Contacts contacts;

   ContactsListItem(this.contacts);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      child: new Card(
        elevation: 0.0,
        child: new Row(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
              child: new CircleAvatar(
                radius: 20.0,
                backgroundImage: new NetworkImage(contacts.avatar),
              ),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      contacts.name,
                      textAlign: TextAlign.left,
                      style: new TextStyle(fontSize: 15.0),
                    ),
                    margin: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 5.0,
                    )
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      left: 0.0,
                      right: 5.0,
                      bottom: 5.0,
                    ),
                    child: new Text(
                      contacts.company + " | " + contacts.position,
                      style: new TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      left: 0.0,
                      right: 5.0,
                      bottom: 10.0,
                    ),
                    child: new Text(
                      contacts.msg,
                      style: new TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}