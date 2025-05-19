import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../models/hse_report.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';

class ReportSubmissionPage extends StatefulWidget {
  const ReportSubmissionPage({super.key});
  static String id = 'report_submission_page';
  @override
  State<ReportSubmissionPage> createState() => _ReportSubmissionPageState();
}

class _ReportSubmissionPageState extends State<ReportSubmissionPage> {
  final _firestoreService = FirestoreService();
  String employeesText = '';
  String permitsText = '';
  String issuesText = '';

  void submitReport() {
    final report = HSEReport(
      userId: FirebaseAuth.instance.currentUser!.uid,
      employeesPresent: int.tryParse(employeesText) ?? 0,
      permitsIssued: int.tryParse(permitsText) ?? 0,
      issuesOccurred: int.tryParse(issuesText) ?? 0,
      date: DateTime.now(),
    );
    _firestoreService.submitReport(report);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submit HSE Report')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            RoundedTextField(
              hintText: 'Employees Present',
              onChanged: (value) {
                employeesText = value;
              },
            ),
            SizedBox(height: 8.0),
            RoundedTextField(
              hintText: 'Permits Issued',
              onChanged: (value) {
                permitsText = value;
              },
            ),
            SizedBox(height: 8.0),
            RoundedTextField(
              hintText: 'Issues Occurred',
              onChanged: (value) {
                issuesText = value;
              },
            ),
            SizedBox(height: 24.0),
            RoundedButton(
              color: Colors.lightBlueAccent,
              title: 'Submit',
              onPressed: submitReport,
            ),
          ],
        ),
      ),
    );
  }
}
