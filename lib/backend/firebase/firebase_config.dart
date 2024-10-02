import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAmVFZynXX6nZAa46yItzuEOwXqZgnXS-w",
            authDomain: "sunsetsv-fe0fd.firebaseapp.com",
            projectId: "sunsetsv-fe0fd",
            storageBucket: "sunsetsv-fe0fd.appspot.com",
            messagingSenderId: "541915377280",
            appId: "1:541915377280:web:ffc01c19155b8afa688065"));
  } else {
    await Firebase.initializeApp();
  }
}
