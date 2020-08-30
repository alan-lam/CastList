import 'package:flutter/services.dart';

const String episodesDirectory = "assets/jsonRecommendedEpisodes.json";
const String episodesFileName = "jsonRecommendedEpisodes.json";

class ServerService {
  ///
  /// returns JSON data
  /// for more information on the structure of the json
  /// please look at the file [jsonRecommendedEpisodes.json] for
  /// the mapping.
  /// The purpose of this function is to simulate the latency between
  /// an app and the server as it fetches the recommended playlist
  ///
  Future<String> get recommendedEpisodes async {
    await Future.delayed(Duration(seconds: 1));
    String jsonData = await rootBundle.loadString(episodesDirectory);
    return jsonData;
  }
}
