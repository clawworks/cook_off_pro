import 'package:firebase_auth/firebase_auth.dart';

class AppUser {
  const AppUser(this._user);

  final User _user;

  String get id => _user.uid;

  String? get name => _user.displayName;

  Future<void> setName(String? name) async {
    // TODO make the name not nullable
    _user.updateDisplayName(name);
  }

  Future<void> reload() => _user.reload();

  bool get isAnonymous => _user.isAnonymous;

  Future<void> linkWithCredential(AuthCredential credential) =>
      _user.linkWithCredential(credential);

  Future<void> forceRefreshIdToken() => _user.getIdToken(true);

  @override
  String toString() {
    return 'User $id, $name';
  }
}
