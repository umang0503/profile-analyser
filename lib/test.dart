import 'package:flutter/material.dart';
import 'package:github/hello.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
class last_tab extends StatefulWidget {
  String username5;
  last_tab({this.username5});
  @override
  _last_tabState createState() => _last_tabState();
}

class _last_tabState extends State<last_tab> {
  @override
  bool _isLoading = true;
  var _init = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<UserProviders3>(context)
          .getfollowing(widget.username5)
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
    SizedBox(child: _isLoading ? Center(child:Loading(indicator: BallPulseIndicator(), size: 100.0,color: Colors.blueAccent,)
      ,) : SingleChildScrollView(
        child: ListView.builder(itemCount: Provider.of<UserProviders3>(context).followingpost.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {return Padding(
                padding: EdgeInsets.all(5.0),child:ListTile(leading: CircleAvatar(
              backgroundImage: NetworkImage(Provider.of<UserProviders3>(context).followingpost[index].img2),radius: 25,),
              title: Text(Provider.of<UserProviders3>(context).followingpost[index].id3),)
            );

            }))));
  }
}
