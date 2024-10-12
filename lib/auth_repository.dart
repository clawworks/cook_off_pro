import 'package:cook_off_pro/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pUserChanges = StreamProvider<AppUser?>((ref) {
  final authRepo = ref.watch(pAuthRepository);
  return authRepo.userChanges();
});

final pAuthRepository = Provider((ref) {
  return AuthRepository(FirebaseAuth.instance);
});

class AuthRepository {
  AuthRepository(this._auth);
  final FirebaseAuth _auth;

  AppUser? get currentUser => _convertUser(_auth.currentUser);

  Future<AppUser?> signInAnonymously() {
    print("Signing in Anonymously");
    return _auth.signInAnonymously().then((value) => _convertUser(value.user));
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  Future<void> updateUserName(String? name) async {
    print("Updating name in AuthRepository to $name");

    await currentUser?.setName(name);
    await currentUser?.reload();
  }

  Stream<AppUser?> userChanges() {
    return _auth.userChanges().map(_convertUser);
  }

  AppUser? _convertUser(User? user) {
    return user != null ? AppUser(user) : null;
  }
}
