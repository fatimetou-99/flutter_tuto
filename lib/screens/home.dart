import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:api_tuto/models/client.dart';

import '../services/api/demande_api.dart';
import '../utilities/env.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  final studentListKey = GlobalKey<HomeState>();

  @override
  void initState() {
    super.initState();
    // clients = getClientList();
    // print(clients.toString());
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: studentListKey,
      appBar: AppBar(
        title: new Text('API List'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        child: Center(
          child: FutureBuilder<List<User>>(
            future: getClientList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData){
                return CircularProgressIndicator(
                  color: Colors.deepPurpleAccent,
                );
              }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data[index];
                    return Card(
                      child: ListTile(
                          leading: Icon(Icons.person),
                          trailing: Icon(Icons.view_list),
                          title: Text(
                            data.name,
                            style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }
                      ),
                    );
                  },
                );
              },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return Home();
          }));
        },
      ),
    );
  }
}
