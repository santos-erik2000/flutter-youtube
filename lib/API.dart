import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyD9g7HyiOIYukH4O838HJcKDrKo0zBOJQo";
const ID_CHANNEL = "UCPs1J0kwGcJGDQ_ONRrPzgQ";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=${CHAVE_YOUTUBE_API}"
            "&channelId=${ID_CHANNEL}"
            "&q=${pesquisa}"));

    if(response.statusCode == 200){
      Map<String, dynamic> mapResponse = json.decode(response.body);

      List<Video> listaVideo = mapResponse["items"].map<Video>((video) {
        return Video.fromJson(video);
      }).toList();

      return listaVideo;
    }else{
      return [];
    }

  }
}