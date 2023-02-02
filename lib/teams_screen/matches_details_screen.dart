import 'package:flutter/material.dart';
import 'package:football/widget/custom_match_details.dart';

class MatchesDetailsScreen extends StatefulWidget {
  const MatchesDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MatchesDetailsScreen> createState() => _MatchesDetailsScreenState();
}

class _MatchesDetailsScreenState extends State<MatchesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches details'),
      ),
      body: Column(
        children: const [
          CustomMatchDetails(
            teamName: 'Team name',
            stadiumName: 'Staduim  name',
            refereeName: 'Referee name',
            date: '2023-1-23',
            startTime: '03:00Pm',
            endTime: '05:00pm',
          ),
        ],
      ),
    );
  }
}