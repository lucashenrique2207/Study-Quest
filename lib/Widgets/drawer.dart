import 'package:flutter/material.dart';
import 'package:study_quest/pages/aula_page.dart';
import 'package:study_quest/pages/user.dart';

class Drawer extends StatelessWidget {
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
          title: Text("seila"),
          subtitle: Text("sou humano"),
        ),

        Divider(),

        ListTile(
          leading: Icon(Icons.account_box),
          title: Text("Menu"),
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
          title: Text("Mensagens"),
          onTap: (){
            Navigator.push(context,
             MaterialPageRoute(
              builder: (tes) => AulasApp(),
              )
            );
          },
        ),

        ListTile(
          leading: Icon(Icons.email),
          title: Text("Mensagens"),
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

