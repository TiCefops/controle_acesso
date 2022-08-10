
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigConfigure{

  Future<void> initRemoteConfig()async{
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 3),
    ));
    await remoteConfig.fetchAndActivate();

  }
}