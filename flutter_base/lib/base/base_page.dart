export 'package:flutter/material.dart';
import 'package:flutter_base/import.dart';
export 'package:get/get.dart';

abstract class BaseScreen<T extends GetxController> extends StatelessWidget
    with BaseMixin, RouteAware {
  BaseScreen({T? screenController, this.tag, bool isKeep = false, Key? key})
      : super(key: key) {
    if (screenController == null) {
      setController(isKeep: isKeep);
    } else {
      setController(screenController: screenController, isKeep: isKeep);
    }
  }

  late final String? tag;
  late final T controller;

  late final BuildContext context = Get.context!;

  T? putController();

  String? screenName() => '';

  String? get getTag => tag;

  void setController({T? screenController, bool isKeep = false}) {
    T? tempC;
    if (screenController != null) {
      tempC = screenController;
    } else if (!Get.isRegistered<T>(tag: getTag)) {
      tempC = putController();
    }

    if (tempC != null) {
      controller = GetInstance().put<T>(tempC, permanent: isKeep, tag: getTag);
    } else {
      controller = GetInstance().find<T>(tag: getTag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return builder();
  }

  Widget builder();
}

abstract class BaseLoadingScreen<T extends BaseController>
    extends StatelessWidget with BaseMixin, RouteAware {
  BaseLoadingScreen(
      {T? screenController, this.tag, bool isKeep = false, Key? key})
      : super(key: key) {
    if (screenController == null) {
      setController(isKeep: isKeep);
    } else {
      setController(screenController: screenController, isKeep: isKeep);
    }
  }

  late final String? tag;
  late final T controller;

  late final BuildContext context = Get.context!;

  T? putController();

  String? screenName() => '';

  String? get getTag => tag;

  void setController({T? screenController, bool isKeep = false}) {
    T? tempC;
    if (screenController != null) {
      tempC = screenController;
    } else if (!Get.isRegistered<T>(tag: getTag)) {
      tempC = putController();
    }

    if (tempC != null) {
      controller = GetInstance().put<T>(tempC, permanent: isKeep, tag: getTag);
    } else {
      controller = GetInstance().find<T>(tag: getTag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: floatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: appBar(),
        ),
        body: Stack(children: <Widget>[
          builder(),
          ValueListenableBuilder<bool>(
            valueListenable: controller.loadingPage,
            builder: (_, bool loading, __) {
              return Visibility(
                  visible: loading,
                  child: const SafeArea(
                    child: ColoredBox(
                      color: Colors.transparent,
                      child: Center(
                        child: CircularProgressIndicator(color: Colors.red),
                      ),
                    ),
                  ));
            },
          )
        ]));
  }

  Widget builder();
  Widget appBar() {
    return const SizedBox();
  }

  Widget? floatingActionButton() {
    return null;
  }

  @override
  void didPush() {
    _sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    _sendCurrentTabToAnalytics();
  }

  void _sendCurrentTabToAnalytics() {}
}

abstract class BaseScreenStateful<SF extends StatefulWidget,
    T extends GetxController> extends State<SF> with BaseMixin {
  BaseScreenStateful({T? screenController, this.tag, bool isKeep = false}) {
    if (screenController == null) {
      setController(isKeep: isKeep);
    } else {
      setController(screenController: screenController, isKeep: isKeep);
    }
  }

  final String? tag;
  late final T controller;

  T? putController();

  void setController({T? screenController, bool isKeep = false}) {
    T? tempC;
    if (screenController != null) {
      tempC = screenController;
    } else if (!Get.isRegistered<T>(tag: tag)) {
      tempC = putController();
    }

    if (tempC != null) {
      controller = GetInstance().put<T>(tempC, permanent: isKeep, tag: tag);
    } else {
      controller = GetInstance().find<T>(tag: tag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return builder();
  }

  Widget builder();
}
