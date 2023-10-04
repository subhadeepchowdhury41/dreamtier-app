import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  static final _users = FirebaseFirestore.instance.collection('users');
  static Future<Map<String, dynamic>?> fetchUserInfo(String userId) async {
    Map<String, dynamic>? user;
    await _users.doc(userId).get().then((doc) {
      if (doc.exists) {
        user = doc.data() as Map<String, dynamic>;
      }
      return null;
    });
    return {...?user, 'id': userId};
  }
}
