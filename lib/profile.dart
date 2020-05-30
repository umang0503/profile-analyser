import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github/tabview.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import'https.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

class Profile extends StatefulWidget {
  final username1;
  Profile({this.username1});
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _init=true;
  bool _isLoading=false;
  void didChangeDependencies() {

    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<UserProvider>(context)
          .getData(widget.username1)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;

  }
@override


  Widget build(BuildContext context) {

  final user= Provider.of<UserProvider>(context);

    return Scaffold(
   backgroundColor: Colors.white,
    body: _isLoading ? Center(child:Loading(indicator: BallPulseIndicator(), size: 100.0,color: Colors.blueAccent,)
    ,) : user.article.username == null &&
        user.article.followers == null &&
        user.article.imageUrl == null &&
        user.article.followings == null &&
        user.article.public_repo == null
        ? Center(
      child: Image.asset('assets/clock.png'),
    ):Stack(children: <Widget>[Container(decoration: BoxDecoration(gradient: LinearGradient(
     colors:[ Color.fromRGBO(143, 148, 251, 1),
      Color.fromRGBO(143, 148, 251, .6)]
    )),),Padding(padding:EdgeInsets.only(top: 100),child:Column(
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
          CircleAvatar(radius:60,backgroundImage: NetworkImage(user.article.imageUrl))
        ],),
      SizedBox(height:12.0),Text(user.article.username,style:TextStyle(fontSize:25,color:Colors.white,fontWeight: FontWeight.bold )),
      SizedBox(height: 12.0,),Text(
  'Joined at ${DateFormat.yMMMMd("en_US").format(DateTime.parse(user.article.joined_date))}',style: TextStyle(color:Colors.white),),
        SizedBox(height: 16.0,),
        InkWell(onTap: () {
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
                      Animation<double>secAnimation ){return TabBarDemo(username3:user.article.username);
                  }));
        },
          child: Container(width:100,height:40,
            decoration: BoxDecoration(color: Colors.indigo,borderRadius: BorderRadius.circular(10)),child:
          Center(child: Text('Details',style: TextStyle(fontSize: 20,color: Colors.white),)),),
        )
      ],
    )),
    Container(margin: EdgeInsets.only(top:400),
        decoration:BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)
        ))),
      Padding(
        padding: const EdgeInsets.only(top:450,left: 10,right:10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
            Icon(
            Icons.people,
            color: Colors.green,
            size: 30.0,
          ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Followings',
                      style: TextStyle(fontSize:20 ),
                    ),
                  ),
                ],
              ),
              Text(
                user.article.followings.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ), Padding(
        padding: const EdgeInsets.only(top:490,left: 10,right:10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Followers',
                      style: TextStyle(fontSize:20 ),
                    ),
                  ),
                ],
              ),
              Text(
                user.article.followers.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top:530,left: 10,right:10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.insert_drive_file,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Repository',
                      style: TextStyle(fontSize:20 ),
                    ),
                  ),
                ],
              ),
              Text(
                user.article.public_repo.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
     condition(user.article.bio) ],));

  }
  Widget condition(String bigo)
  {
    if(bigo!=null)
      {
        return Padding(padding:const EdgeInsets.only(top:500,left: 15,right:15) ,child: Center(child: Text(bigo,style: TextStyle(fontSize: 20,color: Colors.deepPurple),textAlign: TextAlign.center,)),);
      }
    else{
      return Container();
    }
  }

  }






