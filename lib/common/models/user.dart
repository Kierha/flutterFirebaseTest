class AppUser {
  final String uid;

  AppUser({required this.uid});
}

class AppUserData {
  final String uid;
  final String email;
  final int waterCounter;

  AppUserData(
      {required this.uid, required this.email, required this.waterCounter});
}
