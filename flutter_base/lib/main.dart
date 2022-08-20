// ignore_for_file: always_specify_types, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter_base/controller/lifecycle_event_handler.dart';
import 'package:flutter_base/controller/network_connect.dart';
import 'package:flutter_base/loading_wrapper.dart';
import 'package:flutter_base/utils/localization_service.dart';
import 'package:get_cli/core/locales.g.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'global/app_router.dart';
import 'global/app_theme.dart';
import 'import.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with BaseMixin {
  final LifecycleEventHandler _lifecycleEventHandler = LifecycleEventHandler();
  late StreamSubscription<AppLifecycleState> _streamSubscriptionLifeCycle;

  @override
  void initState() {
    super.initState();
    _streamSubscriptionLifeCycle = _lifecycleEventHandler.streamNotifyLifecycle
        .listen(_listenerLifecycleEvent);
  }

  @override
  void dispose() {
    _streamSubscriptionLifeCycle.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      headerTriggerDistance: 20,
      enableScrollWhenRefreshCompleted: true,
      // headerBuilder: buildHeaderSmartRefresh,
      // footerBuilder: buildFooterSmartRefresh,
      dragSpeedRatio: 0.5,
      child: GetMaterialApp(
        enableLog: true,
        translations: LocalizationService(),
        translationsKeys: AppTranslation.translations,
        locale: LocalizationService.locale,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          RefreshLocalizations.delegate,
          // GlobalMaterialLocalizations.delegate,
          // GlobalWidgetsLocalizations.delegate,
          // GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: LocalizationService.locales,
        fallbackLocale: LocalizationService.fallbackLocale,
        color: color.grey0,
        debugShowCheckedModeBanner: false,
        title: 'QUANG',
        theme: Get.find<AppThemeBase>().themeData,
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: LoadingWrapper(child: NetWorkConnect(child: child)),
          );
        },
        initialRoute: AppRouter.routerSplash,
        getPages: AppRouter.getPages,
      ),
    );
  }

  void _listenerLifecycleEvent(AppLifecycleState event) {}
}
