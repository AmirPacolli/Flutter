import 'package:flutter/material.dart';
import '../user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './users_details.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List users = [];


  void handleTap(id){
      print(id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailsPage(users: users,id: id,),
      ),
    );

  }

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  void fetchUsers() {
    http
        .get("https://reqres.in/api/users?per_page=12")
        .then((http.Response response) {
      var obj = json.decode(response.body);

      setState(() {
        users = obj["data"];
      });
    });
  }

  Widget _buildUsers(context, index) {
    var user = users[index];

    return User(
      firstName: user["first_name"],
      lastName: user["last_name"],
      url: user["avatar"],
      handleTap: handleTap,
      id: user["id"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        body: ListView.builder(
          itemBuilder: _buildUsers,
          itemCount: users.length,
        ));
  }
}
