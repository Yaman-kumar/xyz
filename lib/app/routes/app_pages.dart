import 'package:get/get.dart';

import 'package:xyz/app/modules/categories/bindings/categories_binding.dart';
import 'package:xyz/app/modules/categories/views/categories_view.dart';
import 'package:xyz/app/modules/discover/bindings/discover_binding.dart';
import 'package:xyz/app/modules/discover/views/discover_view.dart';
import 'package:xyz/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:xyz/app/modules/favorite/views/favorite_view.dart';
import 'package:xyz/app/modules/home/bindings/home_binding.dart';
import 'package:xyz/app/modules/home/views/home_view.dart';
import 'package:xyz/app/modules/login/bindings/login_binding.dart';
import 'package:xyz/app/modules/login/views/login_view.dart';
import 'package:xyz/app/modules/navbar/bindings/navbar_binding.dart';
import 'package:xyz/app/modules/navbar/views/navbar_view.dart';
import 'package:xyz/app/modules/notification/bindings/notification_binding.dart';
import 'package:xyz/app/modules/notification/views/notification_view.dart';
import 'package:xyz/app/modules/otp/bindings/otp_binding.dart';
import 'package:xyz/app/modules/otp/views/otp_view.dart';
import 'package:xyz/app/modules/player_ui/bindings/player_ui_binding.dart';
import 'package:xyz/app/modules/player_ui/views/player_ui_view.dart';
import 'package:xyz/app/modules/pre_sign_up/bindings/pre_sign_up_binding.dart';
import 'package:xyz/app/modules/pre_sign_up/views/pre_sign_up_view.dart';
import 'package:xyz/app/modules/profile/bindings/profile_binding.dart';
import 'package:xyz/app/modules/profile/views/profile_view.dart';
import 'package:xyz/app/modules/recommended/bindings/recommended_binding.dart';
import 'package:xyz/app/modules/recommended/views/recommended_view.dart';
import 'package:xyz/app/modules/setting/bindings/setting_binding.dart';
import 'package:xyz/app/modules/setting/views/setting_view.dart';
import 'package:xyz/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:xyz/app/modules/sign_up/views/sign_up_view.dart';
import 'package:xyz/app/modules/splash/bindings/splash_binding.dart';
import 'package:xyz/app/modules/splash/views/splash_view.dart';
import 'package:xyz/app/modules/track/bindings/track_binding.dart';
import 'package:xyz/app/modules/track/views/track_view.dart';
import 'package:xyz/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:xyz/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.PRE_SIGN_UP,
      page: () => PreSignUpView(),
      binding: PreSignUpBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.RECOMMENDED,
      page: () => RecommendedView(),
      binding: RecommendedBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.TRACK,
      page: () => TrackView(),
      binding: TrackBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.DISCOVER,
      page: () => DiscoverView(),
      binding: DiscoverBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.PLAYER_UI,
      page: () => PlayerUiView(),
      binding: PlayerUiBinding(),
    ),
  ];
}
