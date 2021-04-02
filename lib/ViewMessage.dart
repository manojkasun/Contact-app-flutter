
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:contact_up_app/Controller/messageController.dart';
import 'package:contact_up_app/contacts.dart';
import 'package:flutter/material.dart';

import 'home_ui.dart';

class ViewMessage extends StatefulWidget {
  List list;
  int index;
  ViewMessage({this.index, this.list});
  @override
  _ViewMessageState createState() => _ViewMessageState();
}

class _ViewMessageState extends State<ViewMessage> {
  var name;
  var email;
  var contact;
  var message;


  @override
  void initState() {
    super.initState();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    var name;var email; var contact; var message;
    var id = "${widget.list[widget.index]['_id']}";
    return Scaffold(
      appBar: AppBar(
        title: new Text("Add Contact"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              Center(
                child: Card(
                  elevation: 8.0,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: "${widget.list[widget.index]['name']}"
                          ),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              labelText: "${widget.list[widget.index]['email']}"
                          ),

                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone_android),
                              labelText: "${widget.list[widget.index]['contact']}"
                          ),
                          autocorrect: false,
                          onChanged: (value) {
                           contact = value;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.message),
                              labelText: "${widget.list[widget.index]['message']}"
                          ),
                          autocorrect: false,
                          onChanged: (value) {
                            message = value;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            height: 100,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children : <Widget>[
                                  Expanded(
                                      child: RaisedButton(
                                          onPressed: () {

                                            if(name == null || email == null || contact == null || message == null)
                                            {
                                              AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.ERROR,
                                                animType: AnimType.BOTTOMSLIDE,
                                                title: 'Message Update Failed!!',
                                                desc: 'All Fields Required.. Please Try Again..',
                                                btnCancelOnPress: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => HomeScreen())
                                                  );
                                                },
                                                btnOkOnPress: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => ViewMessage())
                                                  );
                                                },
                                              )..show();
                                            }
                                           else{

                                              Message.updateMessage(name,email,contact,message,id);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => ContactsScreen())
                                              );
                                            }
                                          },
                                          color: Colors.lime,
                                          child: Text("Update", style: TextStyle(color: Colors.black),)
                                      )
                                  ),
                                  Expanded(
                                      child: RaisedButton(
                                          onPressed: () {
                                            Message.deleteMessage(id);
                                            AwesomeDialog(
                                              context: context,
                                              dialogType: DialogType.SUCCES,
                                              animType: AnimType.BOTTOMSLIDE,
                                              title: 'Message DELETED!!',
                                              desc: 'Go to Home..',
                                              btnCancelOnPress: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => HomeScreen())
                                                );
                                              },
                                              btnOkOnPress: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => HomeScreen())
                                                );
                                              },
                                            )..show();
                                          },
                                          color: Colors.red,
                                          child: Text("Delete", style: TextStyle(color: Colors.white),)
                                      )
                                  ),
                                ])
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

