import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/app/info_tek_app.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/network/cache_module.dart';
import 'package:invotek/core/services/local_notification_service.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/core/utils/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheModule.init(persistent: true);
  // Initialize services
  await StorageService.init();
  await LocalNotificationService().initialize();

  // Configure dependency injection
  await configureDependencies();

  // Setup Bloc observer for logging
  Bloc.observer = AppBlocObserver();

  runApp(const InfoTekApp());
}
