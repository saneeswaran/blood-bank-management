import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

typedef Failure = String;

// hivetype 0 blood requst hive

//instants

final firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

//collection

final userCollection = firestore.collection("users");
final bloodCollection = firestore.collection("blood_request");
