import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class UserDetailsPage extends StatefulWidget {
  final List users;
  final int id;

  UserDetailsPage({this.users, this.id});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserDetailsPageState(id, users);
  }
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  int id;
  List users;
  String firstName = "";
  String lastName = "";
  String avatar = "";
  String email = "";

  _UserDetailsPageState(this.id, this.users);

  _handleNextPress() {
    if (id >= 12) {
      return null;
    } else {
      setState(
        () {
          id = id + 1;
        },
      );
    }
  }

  _handleBackPress() {
    if (id <= 1) {
      return null;
    } else {
      setState(
        () {
          id = id - 1;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    users.forEach((user) {
      if (id == user["id"]) {
        setState(() {
          firstName = user["first_name"];
          lastName = user["last_name"];
          email = user["email"];
          avatar = user["avatar"];
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(firstName + " " + lastName),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRect(
                child: PhotoView(
                  imageProvider: NetworkImage(avatar),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: 5.0,
                ),
              ),
            ),
            width: 200,
            height: 200,
            margin: EdgeInsets.symmetric(vertical: 20.0),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "ID: " + id.toString(),
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "First Name: " + firstName,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Last Name: " + lastName,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Email: " + email,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            height: 150,
            padding: EdgeInsets.all(20),
          ),
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 120.0,
                  height: 50.0,
                  child: RaisedButton(
                    child: Text("Back"),
                    onPressed: () {
                      _handleBackPress();
                    },
                    color: Colors.blue,
                  ),
                ),
                ButtonTheme(
                  minWidth: 120.0,
                  height: 50.0,
                  child: RaisedButton(
                    child: Text("Next"),
                    onPressed: () {
                      _handleNextPress();
                    },
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
