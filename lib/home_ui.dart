import 'package:contact_up_app/contacts.dart';
import 'package:flutter/material.dart';

import 'add-contact.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Center(
            child:  Text('Home page'),
          )
        ),
        body: Center(

          child: Column(
            children:  <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 400,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                    elevation: 18.0,
                    color: Color(0xFF801E48),
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
                      onPressed: () async {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContactsScreen()),
                        );
                      },
                      minWidth: 150.0,
                      height: 50.0,
                      elevation: 1.5,
                      color: Colors.white,
                      child: Text(
                        "View Messages",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Material(
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                    elevation: 18.0,
                    color: Color(0xFF801E48),
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
                      onPressed: () async {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddMessage()),
                        );
                      },
                      minWidth: 150.0,
                      height: 50.0,
                      elevation: 1.5,
                      color: Colors.white,
                      child: Text(
                        "Add Message",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]
          ),

        ),
    



    );
  }
}
