import 'package:flutter/material.dart';
import 'package:premiere_league/team.dart';
import 'package:premiere_league/team_widget.dart';

final int itemCount = 16;

class RankingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double itemHeight = screenHeight / 16;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildLineGradient(),
            Expanded(
              child: Column(
                children: [
                  for (int i = 0; i < itemCount; i++) ...[
                    Expanded(
                      child: TeamWidget(
                        position: i + 1,
                        prevTeam: teams[i],
                        nextTeam: i + 1 < itemCount ? teams[i + 1] : teams[0],
                        itemHeight: itemHeight,
                      ),
                    )
                  ]
                ],
              ),
            ),
            _buildLineGradient(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple.shade900,
            Colors.deepPurple.shade600,
            Colors.deepPurple,
            Colors.deepPurple.shade300,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Pos',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              'Club',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              'Pl',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              'GD',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              'Pts',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLineGradient() {
    return Container(
      height: 5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigo,
            Colors.deepPurple.shade600,
            Colors.deepPurple.shade400,
            Colors.blue,
            Colors.lightBlue,
            Colors.lightBlueAccent,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
