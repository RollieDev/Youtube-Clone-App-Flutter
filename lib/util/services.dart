import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:youtube_clone_app/models/channel_info.dart';
import 'package:youtube_clone_app/util/constants.dart';

class Services {
  //
  static const ChANNEL_ID = 'UC14p9XBzofIsiGvNLpf0wkw';
  static const _baseURL = 'youtube.googleapis.com';


  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': ChANNEL_ID,
      'key': Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'apllication/json'
    };
    Uri uri = Uri.https(
      _baseURL,
      '/youtube/v3/channels',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    print(response.body);
    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }
}
