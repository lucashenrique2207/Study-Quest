import 'package:flutter/material.dart';
import 'package:study_quest/pages/aula_page.dart';
import 'package:study_quest/pages/user.dart';

class MeuDrawer extends StatelessWidget {
  const Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(children: <Widget>[

        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(""),
        ),

        ListTile(
          title: Text("Gustavo Dias"),
          subtitle: Text(""),
        ),

        Divider(),

        ListTile(
          leading: Icon(Icons.account_box),
          title: Text("Usuario"),
          onTap: (){
            Navigator.push(context,
             MaterialPageRoute(
              builder: (m) => MyApp()
              )
            );
          },
        ),

        ListTile(
          leading: Icon(Icons.email),
          title: Text("Home"),
          onTap: (){
            Navigator.push(context,
             MaterialPageRoute(
              builder: (tes) => AulasApp(),
              )
            );
          },
        ),

        

      ],
      ),
    );
  }
}

