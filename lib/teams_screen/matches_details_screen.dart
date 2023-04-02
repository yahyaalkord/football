import 'package:flutter/material.dart';
import 'package:football/model/team_match.dart';
import 'package:football/widget/custom_match_details.dart';

class MatchesDetailsScreen extends StatefulWidget {
  const MatchesDetailsScreen({required this.match,Key? key}) : super(key: key);
  final TeamMatch match;

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
        children:  [
          CustomMatchDetails(
            teamName: widget.match.teamA,
            stadiumName: widget.match.staduim,
            refereeName: widget.match.referee,
            date: widget.match.date,
            startTime: widget.match.time,
            endTime: '',
          ),
        ],
      ),
    );
  }
}