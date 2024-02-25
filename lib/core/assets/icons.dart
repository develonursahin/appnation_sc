class AppIcons {
  AppIcons._();
  static AppIcons? _instace;
  static AppIcons get instance {
    if (_instace != null) return _instace!;
    _instace = AppIcons._();
    return _instace!;
  }

  static const String _basePath = "assets/icons/";
  String _joinPath(String filename) => '$_basePath$filename';

  //Splash View
  String get logoSVG => _joinPath("logo.svg");
  String get logoPNG => _joinPath("logo.png");

  //Main View
  String get home => _joinPath("home.svg");
  String get settings => _joinPath("settings.svg");

  //Settings View
  String get help => _joinPath("help.svg");
  String get rateUs => _joinPath("rate_us.svg");
  String get shareFriends => _joinPath("share_friends.svg");
  String get termsOfUse => _joinPath("terms_of_use.svg");
  String get privacyPolicy => _joinPath("privacy_policy.svg");
  String get osVersion => _joinPath("os_version.svg");
  String get arrowUpRight => _joinPath("arrow_up_right.svg");
}
