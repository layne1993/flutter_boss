import 'package:flutter/material.dart';
import 'package:flutter_boss/app/item/contactsList_item.dart';
import 'package:flutter_boss/app/model/contacts.dart';

const _kContactList = '{"list": [{"avatar": "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3363295869,2467511306&fm=26&gp=0.jpg", "name": "小可爱", "company": "百度", "position": "HR", "msg": "你好"}]}';

class ContactsTab extends StatefulWidget {
  @override
  ContactsList createState() => new ContactsList();
}

class ContactsList extends State<ContactsTab> {
  List<Contacts> _contacts = [];

  @override
  void initState() {
    super.initState();
    getContactsList();
  }

  void getContactsList() {
    setState(() {
      _contacts = Contacts.fromJson(_kContactList);
    });
  }

  Widget buildContactsItem(BuildContext context, int index) {
    Contacts contact = _contacts[index];

    var contactsItem = new InkWell(
      onTap: () {
        showDialog(
          context: context,
          child: new AlertDialog(
            content: new Text(
              "敬请期待",
              style: new TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        );
      },
      child: new ContactsListItem(contact),
    );
    return contactsItem;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(
          'Android',
          style: new TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
      body: new ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: buildContactsItem,
      ),
    );
  }
}
