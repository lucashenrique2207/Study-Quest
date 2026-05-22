import 'package:flutter/material.dart';
import 'package:study_quest/Widgets/Background.dart';
import 'package:study_quest/Widgets/Semana.dart';
import 'package:study_quest/pages/paginap.dart';

class HomePage extends StatelessWidget {
   const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      children: <Widget>[

        const BackgroundOrb(size: 200,
          color: Color.fromRGBO(33, 150, 243, 1), top: 50,
           left: 30),

        const WeeklyRewardWidget(weekDays: ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"],
         chestReward: ["", "", "💎", "", "", "", ""],
         initialTodayIdx: 2),



          

      ],
    );
  }
}

