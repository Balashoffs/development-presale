import 'package:dart_seq/dart_seq.dart';
import 'package:dart_seq_http_client/dart_seq_http_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:presale/src/data/core/db_client.dart';
import 'package:presale/src/data/data_sources/v5/design_offer_memory_source.dart';
import 'package:presale/src/presentation/bloc/auth/auth_cubit.dart';
import 'package:presale/src/presentation/bloc/core/core/global_bloc_observer.dart';
import 'package:presale/src/presentation/bloc/core/navigation/navigation_cubit.dart';

import 'package:presale/src/presentation/bloc/user/user_repository.dart';
import 'package:presale/src/presentation/core/navigation/app_router.dart';
import 'package:presale/src/utils/dart_define/dart_define_utils.dart';
import 'package:presale/src/utils/dart_define/model/dart_define_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const di = DependencyInjector();

class DependencyInjector {
  const DependencyInjector();

  static final _getItInstance = GetIt.instance;

  final FlutterSecureStorage flutterAuthSecureStorage =
      const FlutterSecureStorage(
        wOptions: WindowsOptions(useBackwardCompatibility: true),
        mOptions: MacOsOptions(),
        webOptions: WebOptions(dbName: 'Auth'),
        aOptions: AndroidOptions(
          storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
          resetOnError: true,
        ),
      );

  Future<void> init() async {
    await _registerDBClient();
    await _setupStorageAndObserver();
    // await _initSegClient();

    _registerRouter();
    _registerBlocs();
  }

  void _initBuildConfig() {
    DartDefineModel dartDefineModel = buildFrom();
    _getItInstance.registerSingleton<DartDefineModel>(dartDefineModel);
  }

  Future<void> _initSegClient() async {
    SeqLogger logger = SeqHttpLogger.create(
      host: 'http://localhost:5341',
      globalContext: {'App': 'PresaleCalc'},
    );
    _getItInstance.registerSingleton<SeqLogger>(logger);
  }

  void _registerRouter() {
    _getItInstance.registerSingleton<AppRouter>(AppRouter());
  }

  void initConfig() {
    _initBuildConfig();
  }

  Future<void> _registerDBClient() async {
    final preferences = await SharedPreferences.getInstance();
    _getItInstance.registerLazySingleton<DBClient>(
      () => DBClientImpl(preferences),
    );

    _getItInstance.registerLazySingleton<DesignOfferMemorySource>(() => DesignOfferMemorySource(),);
  }

  Future<void> _setupStorageAndObserver() async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );

    Bloc.observer = GlobalBlocObserver();
  }

  void _registerBlocs() {
    /// User
    _getItInstance.registerSingleton<AuthCubit>(AuthCubit());

    _getItInstance.registerSingleton<UserRepository>(UserRepository());

    /// Navigation
    _getItInstance.registerSingleton<NavigationCubit>(
      NavigationCubit(
        _getItInstance<UserRepository>(),
        _getItInstance<AppRouter>(),
      ),
    );
  }

  /// Core

  NavigationCubit get navigationCubit => _getItInstance<NavigationCubit>();

  /// Auth
  AuthCubit get authCubit => _getItInstance<AuthCubit>();

  UserRepository get userRepository => _getItInstance<UserRepository>();

  SeqLogger get segLogger => _getItInstance<SeqLogger>();

  DBClient get dbClientImpl => _getItInstance<DBClient>();
  DesignOfferMemorySource get inMemoryImpl => _getItInstance<DesignOfferMemorySource>();

  DartDefineModel get dartDefineModel => _getItInstance<DartDefineModel>();

  AppRouter get appGoRouter => _getItInstance<AppRouter>();
}
