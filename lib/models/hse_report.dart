import 'package:flutter/material.dart';

class HSEReport {
  final String userId;
  final int employeesPresent;
  final int permitsIssued;
  final int issuesOccurred;
  final DateTime date;

  HSEReport({
    required this.userId,
    required this.employeesPresent,
    required this.permitsIssued,
    required this.issuesOccurred,
    required this.date,
  });

  Map<String, dynamic> toMap() => {
    'userId': userId,
    'employeesPresent': employeesPresent,
    'permitsIssued': permitsIssued,
    'issuesOccurred': issuesOccurred,
    'date': date.toIso8601String(),
  };

  factory HSEReport.fromMap(Map<String, dynamic> map) => HSEReport(
    userId: map['userId'],
    employeesPresent: map['employeesPresent'],
    permitsIssued: map['permitsIssued'],
    issuesOccurred: map['issuesOccurred'],
    date: DateTime.parse(map['date']),
  );
}
