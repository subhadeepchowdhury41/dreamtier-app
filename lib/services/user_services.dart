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

  static Future<Map<String, dynamic>?> createUser(String userId, String email,
      String phone, String name) async {
    Map<String, dynamic>? result;
    await _users.doc(userId).set({
      'email': email,
      'phone': phone,
      'fname': name,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    }).then((value) {
      result = {
        'id': userId,
        'email': email,
        'phone': phone,
        'name': name,
      };
    });
    return result;
  }
}
