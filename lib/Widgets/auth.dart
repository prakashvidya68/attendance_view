import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import '../Dummy/attendance.dart';

class AuthService {
  FirebaseUser mCurrentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  // Shared State for Widgets
  Observable<FirebaseUser> user; // firebase user
  Observable<Map<String, dynamic>> profile; // custom user data in Firestore
  PublishSubject loading = PublishSubject();

  // constructor
  AuthService() {
    user = Observable(_auth.onAuthStateChanged);

    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return _db
            .collection('users')
            .document(u.uid)
            .snapshots()
            .map((snap) => snap.data);
      } else {
        return Observable.just({});
      }
    });

    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        print("\n\n\n\n\nHello\n\n\n\n\n\n\n\n");
        return _db
            .collection('users')
            .document(u.uid)
            .snapshots()
            .map((snap) => snap.data);
      } else {
        print("\n\n\n\n\n\nNOT HELLO\n\n\n\n\n\n\n");
        return Observable.just({});
      }
    });
  }

  Future<FirebaseUser> googleSignIn() async {
    loading.add(true);

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final AuthResult result = await _auth.signInWithCredential(credential);
    final FirebaseUser user = result.user;

    updateUserData(user);
    // Done
    loading.add(false);
    print("\n\n\n\n\n\n\nsigned in " + user.displayName + '\n\n\n\n\n\n');
    return user;
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now(),
      'Attendance': {
        '0': AttData[0].atten,
        '1': AttData[1].atten,
        '2': AttData[2].atten,
        '3': AttData[3].atten,
      },
      'Class': 'B.E 5th Sem',
      'anounce': {
        '1':
            'It is Informaed to all students that Parents Meeting has been organised on 06/11/2019',
        '2': 'Our Department is organizing inter department Tech Fest ("INCEPTION") in which a lot of cool events will take place, So Every student and Teacher is invited to paricipate...'
      },
      'rollNumber': 24,
    }, merge: false);
  }

  void signOut() {
    _auth.signOut();
  }
}

final AuthService authService = AuthService();
