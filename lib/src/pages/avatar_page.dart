import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static String pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar page'),
        actions: [
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/74/fb/ae/74fbae9715ab886eb7321d68fdc71e47.jpg'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
          child: FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(
            'https://cdn.colombia.com/images/v2/colombia-info/informacion/informacion-800.jpg'),
        fadeInDuration: Duration(milliseconds: 300),
      )),
    );
  }
}
