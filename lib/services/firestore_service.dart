import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/hse_report.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Future<void> submitReport(HSEReport report) async {
    await _db.collection('hse_reports').add(report.toMap());
  }
}
