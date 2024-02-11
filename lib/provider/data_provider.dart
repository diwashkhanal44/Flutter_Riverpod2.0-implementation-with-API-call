import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/model/user_model.dart';
import 'package:practice/services/services.dart';

final webServicesProvider = Provider<WebServices>((ref) => Users());

final dataProvider = FutureProvider<List<UserModel>>(
  (ref) async => ref.watch(webServicesProvider).getUsers(),
);
