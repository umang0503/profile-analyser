
import 'package:flutter/material.dart';
import 'package:github/Repository.dart';
import 'package:github/fade.dart';
import 'package:github/profile.dart';
class HomePage extends StatelessWidget {
  TextEditingController username=new TextEditingController();
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/server.png'),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Stack(
                      children: <Widget>[

                        Positioned(
                          child: FadeAnimation(1.6, Container(
                            margin: EdgeInsets.only(top: 50,left: 110),
                            child: Center(
                              child: Text("Github", style: TextStyle(color: Colors.deepPurple, fontSize: 40, fontWeight: FontWeight.bold),),
                            ),
                          )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(1.8, Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10)
                                )
                              ]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                ),
                                child: TextField(controller: username,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter your username",
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                ),
                              ),

                            ],
                          ),
                        )),
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(transitionDuration:Duration(milliseconds: 400),
                              transitionsBuilder:(BuildContext context,
                              Animation<double>animation,
                            Animation<double>secAnimation,
                            Widget child){animation=CurvedAnimation(parent: animation,curve: Curves.bounceInOut);
                                  return ScaleTransition(alignment: Alignment.center,
                            scale:animation,
                            child:child,
                            );
                            },
                            pageBuilder:(BuildContext context,
                            Animation<double>animation,
                            Animation<double>secAnimation ){return Profile(username1: username.text);
                          }));
                          },
                          child:FadeAnimation(2, Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ]
                              )
                          ),
                          child: Center(
                            child: Text("Submit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        )),

                        )],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}