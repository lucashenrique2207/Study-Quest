import 'package:flutter/material.dart';
import 'package:studyquest/pages/aula_page.dart';
import 'package:studyquest/pages/progresso.dart';
import 'package:studyquest/pages/user.dart';

class MeuDrawer extends StatelessWidget {
  const MeuDrawer({super.key});

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
              builder: (a) => MyApp(),
              )
            );
          },
        ),

        ListTile(
          leading: Icon(Icons.home),
          title: Text("Usuario"),
          onTap: (){
            Navigator.push(context,
             MaterialPageRoute(
              builder: (b) => HomePage(),
              )
            );
          },
        ),

        ListTile(
          leading: Icon(Icons.book),
          title: Text("Aulas"),
          onTap: (){
            Navigator.push(context,
             MaterialPageRoute(
              builder: (c) => AulasApp(),
              )
            );
          },
        ),

        ListTile(
          leading: Icon(Icons.alarm),
          title: Text("Desafios"),
          onTap: (){
            Navigator.push(context,
             MaterialPageRoute(
              builder: (d) => QuestsApp(),
              )
            );
          },
        ),

        

      ],
      ),
    );
  }
}

