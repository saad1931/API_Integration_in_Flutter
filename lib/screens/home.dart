import 'dart:convert';

import 'package:flutter/material.dart';

import '../services/services.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getUsers(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
          if (snapshot.hasError) 
          {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
              return ListTile(
                title: Text(snapshot.data[index].company.name),
                //title: Text(snapshot.data[index].email),
              );
            }
            );
          },
        )
      ),
    );
  }
}
