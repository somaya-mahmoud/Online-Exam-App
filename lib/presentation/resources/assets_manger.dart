const String imagePath = "assets/images/";

class ImageAssets {
static const String logo = "${imagePath}logo.jpg";

}

class IconsAssets {
  IconsAssets._();

  static const String _basePath = "assets/icons/";
// static const String awards = "${_basePath}Awards result.svg";
}

class SVGAssets {
  SVGAssets._();

  static const String _basePath = "assets/svg/";
  static const String explore = "${_basePath}Explore.svg";
  static const String result = "${_basePath}result.svg";
  static const String profile = "${_basePath}prpfile.svg";


}

class LottieAssets {
  LottieAssets._();

  static const String _basePath = "assets/lotties/";

  static const String success = "${_basePath}success.json";
  static const String loading = "${_basePath}loading.json";
  static const String error = "${_basePath}error.json";
  static const String call = "${_basePath}viber.json";
  static const String underConstruction = "${_basePath}under_construction.json";
  static const String noContent = "${_basePath}no_content.json";
  static const String noPermissions = "${_basePath}no_permissions.json";
  static const String verificationPending =
      "${_basePath}verification_pending.json";
}