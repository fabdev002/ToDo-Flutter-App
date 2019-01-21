import 'package:flutter/material.dart';

import 'package:to_do_flutter_app/model/TaskTypesCardView.dart';

void main() {
  runApp(MaterialApp(
    title: "My TODO App",
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: Text(
          "TODO",
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Raleway_Regular',
              letterSpacing: 1.5),
        ),
        elevation: 0.0,
        actions: <Widget>[
          Icon(Icons.search),
          Padding(padding: EdgeInsets.only(right: 20.0)),
        ],
      ),
      drawer: Drawer(),
      body: UserInfoSection(),
    );
  }
}

Widget _cardViewUI(BuildContext context, int index){

  List<TaskTypesCardView> taskTypesList = new List();

  taskTypesList.add(TaskTypesCardView(15, "Personal", 85));
  taskTypesList.add(TaskTypesCardView(3, "Work", 40));
  taskTypesList.add(TaskTypesCardView(8, "Home", 67));

  return Container(
    child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.account_circle,size: 27.0,color: Colors.grey,),
                Icon(Icons.done_all,size: 30.0,color: Colors.green,)
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Column(
              children: <Widget>[
                Text(taskTypesList[index].taskRemaining.toString(),style: TextStyle(fontSize: 22.0),),
                Text(taskTypesList[index].typeName,style: TextStyle(fontSize: 30.0,color: Colors.black,fontWeight: FontWeight.w600),),
                Padding(
                  padding: const EdgeInsets.only(top:25.0,bottom: 10.0),
                  child: LinearProgressIndicator(backgroundColor: Colors.blue,value: 100),
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )
          ],
        ),
      ),
    ),
    width: 250,
    margin: EdgeInsets.only(left: 10,bottom: 10),
  );
}

class UserInfoSection extends StatefulWidget {
  @override
  _UserInfoSectionState createState() => _UserInfoSectionState();
}

class _UserInfoSectionState extends State<UserInfoSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    size: 45.0,
                    color: Colors.white,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  Text(
                    " Hello, Jane",
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    " Looks like feel good.",
                    style: TextStyle(fontSize: 20.0, color: Colors.white70),
                  ),
                  Text(
                    " You have 3 tasks to do today.",
                    style: TextStyle(fontSize: 20.0, color: Colors.white70),
                  ),
                  SizedBox(height: 60,),
                  Text(
                    " TODAY : SEPTEMBER 12, 2017",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: _cardViewUI,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(right: 10),
            ),
          )
        ],
      ),
      color: Colors.deepOrange,
    );
  }
}