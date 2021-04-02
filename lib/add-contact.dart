import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:contact_up_app/home_ui.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Controller/messageController.dart';
import 'contacts.dart';

class AddMessage extends StatelessWidget {
  Message msg = new Message();
  @override
  Widget build(BuildContext context) {
    var name;var email; var contact; var message;
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
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                           labelText: name,
                          ),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.mail),
                          labelText: email,
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.contact_phone),
                            labelText: "Contact Number",
                          ),
                          autocorrect: false,
                          onChanged: (value) {
                          contact = value;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextField(
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 40.0),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.message),
                            labelText: "Message",
                          ),
                          autocorrect: false,
                          onChanged: (value) {
                           message = value;
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),

                        SizedBox(
                          height: 15.0,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(30.0),
                          //elevation: 5.0,
                          child: MaterialButton(
                            onPressed: () async {
                              if(name == null || email == null || contact == null || message == null)
                                {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.ERROR,
                                    animType: AnimType.BOTTOMSLIDE,
                                    title: 'Message Send Failed!!',
                                    desc: 'Something is Wrong.. Please Try Again..',
                                    btnCancelOnPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomeScreen())
                                      );
                                    },
                                    btnOkOnPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => AddMessage())
                                      );
                                    },
                                  )..show();
                                }
                              else{
                                Message.addMessage(name,email,contact,message);
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                String status = prefs.getString("status");

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ContactsScreen())
                                  );
                              }


                            },
                            minWidth: 150.0,
                            height: 50.0,
                            color: Colors.blueAccent,
                            child: Text(
                              "SEND Message".toUpperCase(),
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
