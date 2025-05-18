import 'package:flutter/material.dart';
import 'package:hse_app/constants.dart';
import 'package:hse_app/pages/admin_dashboard_page.dart';
import 'package:hse_app/pages/report_submission_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HSE Home')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Submit Report',
                onPressed:
                    () => Navigator.pushNamed(context, ReportSubmissionPage.id),
              ),
              RoundedButton(
                color: Colors.lightBlueAccent,
                title: 'Admin Dashboard',
                onPressed:
                    () => Navigator.pushNamed(context, AdminDashboardPage.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
