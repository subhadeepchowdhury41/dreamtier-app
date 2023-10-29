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

  static Future<Map<String, dynamic>?> createUser(
      String userId, String email, String phone, String name) async {
    Map<String, dynamic>? result;
    await _users.doc(userId).set({
      'email': email,
      'phone': phone,
      'name': name,
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

  static Future<void> updateUser(
      String userId, Map<String, dynamic> data) async {
    await _users.doc(userId).update(data);
  }

  static Future<String?> nextRequiredRegistration(String userId) async {
    String? next;
    await _users.doc(userId).get().then((user) {
      if (user.exists) {
        final data = user.data() as Map<String, dynamic>;
        if (data['bio'] == null) {
          next = 'bio';
        } else if (data['interests'] == null || (data['links'] as List).isEmpty) {
          next = 'interests';
        } else if (data['pfp'] == null) {
          next = 'pfp';
        } else if (data['projects'] == null || (data['projects'] as List).isEmpty) {
          next = 'projects';
        } else if (data['links'] == null || (data['links'] as List).isEmpty) {
          next = 'links';
        } else if (data['address'] == null) {
          next = 'address';
        } else if (data['zip'] == null) {
          next = 'zip';
        }
      }
    });
    return next;
  }
}
