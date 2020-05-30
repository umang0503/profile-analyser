import'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

import 'https3.dart';
class followers extends StatefulWidget {
  String username4;
  followers({this.username4});
  @override
  _followersState createState() => _followersState();
}

class _followersState extends State<followers> {
  bool _isLoading = true;
  var _init = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<UserProviders2>(context)
          .getfollow(widget.username4)
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _init = false;
  }
  Widget build(BuildContext context) {
    return  Scaffold(body:
    SizedBox(child: _isLoading ? Center(child: Loading(indicator: BallPulseIndicator(), size: 100.0,color: Colors.blueAccent,)
    ,) : SingleChildScrollView(
    child: ListView.builder(itemCount: Provider.of<UserProviders2>(context).followpost.length,
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    itemBuilder: (context, index) {return Padding(
      padding: EdgeInsets.all(10.0),child:ListTile(leading: CircleAvatar(
      backgroundImage: NetworkImage(Provider.of<UserProviders2>(context).followpost[index].img),radius: 25,),
      title: Text(Provider.of<UserProviders2>(context).followpost[index].id2),)
    );
        
  }))));
}}
