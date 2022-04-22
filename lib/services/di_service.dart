import 'package:get_it/get_it.dart';
import 'package:ninjastudies/network/repository/conversation_api_repo.dart';

final sl = GetIt.instance;

/// Initializes service locator and registers classes
Future<void> initSL(String baseUrl) async {
  // Repository/Apiservices

  //Registering as a normal singleton to get the same instance everytime
  sl.registerLazySingleton<ConversationApiRepo>(
      () => ConversationApiRepo(baseUrl));
}
