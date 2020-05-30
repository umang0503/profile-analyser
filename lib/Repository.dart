

import'package:flutter/material.dart';
import 'package:github/https2.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import'package:provider/provider.dart';
import'package:intl/intl.dart';


class git_Repo extends StatefulWidget {
  final username2;
  git_Repo({this.username2});

  @override
  _git_RepoState createState() => _git_RepoState();
}

class _git_RepoState extends State<git_Repo> {

  bool _isLoading = true;
  var _init = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<UserProviders>(context)
          .getRepo(widget.username2)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }


  Widget build(BuildContext context) {


    return Scaffold(body:
    SizedBox(child: _isLoading ? Center(child:Loading(indicator: BallPulseIndicator(), size: 100.0,color: Colors.blueAccent,)
      ,) : SingleChildScrollView(
        child: ListView.builder(itemCount: Provider.of<UserProviders>(context).listpost.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
              border: Border.all(color: Color(0xffd9d9d9), width: 2),
              borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10))),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, .6),
                  ]
              )),

              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
              alignment: Alignment.centerLeft,
              child:
              Text(
                  Provider
                      .of<UserProviders>(context)
                      .listpost[index].id,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              )),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
              children: <Widget>[
              Text(
              'Created :',
              style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff595959)),
              ),
              Text(DateFormat.yMMMMd("en_US").format(DateTime.parse(

                  Provider
                      .of<UserProviders>(context)
                      .listpost[index].created)))
              ],
              ),
              ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Fork :',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff595959)

                            ),
                      ),
                      Text(

                          Provider
                              .of<UserProviders>(context)
                              .listpost[index].fork.toString()),

                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                      Text(
                      'Stars :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                          color: Color(0xff595959)

                      ),
                    ),
                    Text(

                        Provider
                            .of<UserProviders>(context)
                            .listpost[index].stars.toString())])),

              ]));
            }
    ))));

}
}