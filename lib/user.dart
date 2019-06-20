import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final String firstName;
  final String lastName;
  final int id;
  final String url;
  final  handleTap;
  User({this.firstName, this.lastName, this.url, this.handleTap, this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       handleTap(id);
      },
      child: Row(
        children: <Widget>[
          Padding(
            child: Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(url),
              ),
              width: 50,
              height: 50,
            ),
            padding: EdgeInsets.all(10),
          ),
          Container(
            child: Text(firstName + " " + lastName,
                style: TextStyle(
                  fontSize: 16,
                )),
          )
        ],
      ),
    );
  }
}
