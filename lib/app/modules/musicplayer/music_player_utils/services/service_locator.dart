import 'package:audio_service/audio_service.dart';
import 'package:xyz/app/modules/musicplayer/music_player_utils/services/playlist_repo.dart';
import '../page_manager.dart';
import 'audio_handler.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // services
  getIt.registerSingleton<AudioHandler>(await initAudioService());
  getIt.registerLazySingleton<PlaylistRepository>(() => DemoPlaylist());

  // page state
  getIt.registerLazySingleton<PageManager>(() => PageManager());
}