import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:invotek/core/network/cache_module.dart';

import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/server/api_factory.dart';
import 'package:invotek/features/auth/data/data_source/auth_data_source.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';
import 'package:invotek/features/auth/domain/repo/auth_repo.dart';
import 'package:invotek/features/auth/data/data_source/permissions_data_source.dart';
import 'package:invotek/features/auth/domain/repo/permissions_repo.dart';

part 'init_dependencies.main.dart';
