import 'package:flutter/material.dart';

import '../ViewMessage.dart';
class MessagesList extends StatelessWidget {

  final List list;
  MessagesList({this.list});


  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(15.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                  builder: (BuildContext context) => new ViewMessage (
                    list: list,
                    index: i,
                  )),
            ),
            child: new Card(
              child: new ListTile(
                leading: Icon(Icons.message_rounded),
                title: new  RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text:  "\nFrom:\t" + list[i]['name'].toString(),

                    style: TextStyle(color: Colors.black87, fontSize: 13, fontWeight: FontWeight.bold,),
                    children: [
                      TextSpan(
                          text: "\n \nEmail:\t" + list[i]['email'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11)),
                      TextSpan(
                          text: "\nContact:\t" + list[i]['contact'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 11),
                      ),
                      TextSpan(
                          text: "\n \nMessage:\t" + list[i]['message'].toString(),
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 11)),
                    ],
                  ),

                ),

              ),

            ),
          ),
        );
      },

    );
  }
}
