import 'package:football/model/users.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum PrefKeys {
  loggedIn,
  usertype,
  token,
  id,
  teamId,
  email,
  name,
  mobile,
  nationality,
  birthDate,
  endDate,
  file,
  startDate,
  rate,
  active,
  image,
  specialization,
  type,
  matchesCount,
  violationsCount,
  imageUrl
}

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveUserType({required String userType}) async {
    await _sharedPreferences.setString(PrefKeys.usertype.name, userType);
  }
  Future<void> adminSave(AdminModel user,{bool withToken = true}) async {
    if(withToken) {
      await _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${user.token}');
    }
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString(PrefKeys.email.name, user.email);
    await _sharedPreferences.setString(PrefKeys.name.name, user.name);

    // print(_sharedPreferences.get(PrefKeys.token.name));
  }

  Future<void> playerSave(PlayerModel user,{bool withToken = true}) async {
    if(withToken) {
      await _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${user.token}');
    }
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString(PrefKeys.email.name, user.email);
    await _sharedPreferences.setString(PrefKeys.name.name, user.name);
    await _sharedPreferences.setString(PrefKeys.image.name, user.image??'');
    await _sharedPreferences.setString(PrefKeys.nationality.name, user.nationality);
    await _sharedPreferences.setString(PrefKeys.birthDate.name, user.birthDate);
    await _sharedPreferences.setString(PrefKeys.startDate.name, user.startDate);
    await _sharedPreferences.setString(PrefKeys.file.name, user.file??'');
    await _sharedPreferences.setInt(PrefKeys.rate.name, user.rate);
    await _sharedPreferences.setString(PrefKeys.type.name, user.type);
    await _sharedPreferences.setString(PrefKeys.specialization.name, user.specialization??'');

    // print(_sharedPreferences.get(PrefKeys.token.name));
  }

  Future<void> teamSave(TeamModel user,{bool withToken = true}) async {
    if(withToken) {
      await _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${user.token}');
    }
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString(PrefKeys.email.name, user.email);
    await _sharedPreferences.setString(PrefKeys.name.name, user.name);
    await _sharedPreferences.setString(PrefKeys.image.name, user.image??'');
    await _sharedPreferences.setString(PrefKeys.mobile.name, user.mobile);
    if(SharedPrefController().getValueFor(key: PrefKeys.usertype.name)=='team'){
      await _sharedPreferences.setInt(PrefKeys.matchesCount.name, user.matchesCount);
      await _sharedPreferences.setInt(PrefKeys.violationsCount.name, user.violationsCount);
    }

    // print(_sharedPreferences.get(PrefKeys.token.name));
  }

  Future<void> saveVisitor(VisitorModel user,{bool withToken = true}) async {
    if(withToken) {
      await _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${user.token}');
    }
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString(PrefKeys.email.name, user.email);
    await _sharedPreferences.setString(PrefKeys.name.name, user.name);
    await _sharedPreferences.setString(PrefKeys.image.name, user.image??'');
    await _sharedPreferences.setString(PrefKeys.mobile.name, user.mobile);
    await _sharedPreferences.setString(PrefKeys.imageUrl.name, user.imageUrl);

    // print(_sharedPreferences.get(PrefKeys.token.name));
  }


  T? getValueFor<T>({required String key}) {
    // print('shared');
    // print('yahya ${_sharedPreferences.get(key)}');
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T?;
    }
    return null;
  }
  void updateVisitorProfile({
    required String name,
    required String email,
    required String mobile,
  })async{
    await _sharedPreferences.setString(PrefKeys.name.name, name);
    await _sharedPreferences.setString(PrefKeys.email.name, email);
    await _sharedPreferences.setString(PrefKeys.mobile.name, mobile);
  }
  void updateVisitorImage({
    required String image,
  })async{
    await _sharedPreferences.setString(PrefKeys.image.name, image);
  }

  void clear() async {
    _sharedPreferences.clear();
  }
}
