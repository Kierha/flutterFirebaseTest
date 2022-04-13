/*import 'package:flutter/foundation.dart';
import 'package:trinityauth/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class getUser {
  final Firestore _fireuser = Firestore.instance;

  Future<UserData> getUserInfo(String uid) async {
    UserData userVal = Userdata();

    try {
      DocumentSnapshot _userSnapshot = await _fireuser.collection("users").document(uid).get();
     userVal = UserData.fromDocumentSnapshot(doc: _userSnapshot);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return userVal;
  }
      
    }
  }
}
*/