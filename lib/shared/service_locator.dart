import 'package:formation_flutter_posts_app/counter_with_provider/logic/counter_provider.dart';
import 'package:formation_flutter_posts_app/genderize/logic/gender_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // conter
  getIt.registerLazySingleton<CounterProvider>(() => CounterProvider(count: 0));

  // genderize
  getIt.registerLazySingleton<GenderProvider>(() => GenderProvider());
}
