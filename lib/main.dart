import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hse_app/pages/welcome_screen.dart';
import 'models/hse_report.dart';
import 'pages/admin_dashboard_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/report_submission_page.dart';
import 'services/firestore_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDRiAuzqZSimHmFz7AJ6zYWu2QOt-MhpyQ",
      appId: "1:61784318:android:50f700685929fdb5bf65af",
      messagingSenderId: "61784318",
      projectId: "hse-app-f75b5",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HSE App',
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginPage.id: (context) => LoginPage(),
        AdminDashboardPage.id: (context) => AdminDashboardPage(),
        HomePage.id: (context) => HomePage(),
        RegisterPage.id: (context) => RegisterPage(),
        ReportSubmissionPage.id: (context) => ReportSubmissionPage(),
      },
    );
  }
}
