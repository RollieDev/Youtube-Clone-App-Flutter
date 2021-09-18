import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:youtube_clone_app/models/channel_info.dart';
import 'package:youtube_clone_app/models/videos_list.dart';
import 'package:youtube_clone_app/util/constants.dart';

class Services {
  // ignore: constant_identifier_names
  static const CHANNEL_ID = 'UC14p9XBzofIsiGvNLpf0wkw';
  static const _baseURL = 'youtube.googleapis.com';

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': CHANNEL_ID,
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

  static Future<VideosList> getVideosList(
      {required String playListId, required String pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playListId,
      'maxResults': '7',
      'pageToken': pageToken,
      'key': Constants.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'apllication/json'
    };
    Uri uri = Uri.https(
      _baseURL,
      '/youtube/v3/channels/playlistItems',
      parameters,
    );
    Response response = await http.get(uri, headers: headers);
    print(response.body);
    VideosList videosList = videosListFromJson(response.body);
    return videosList;
  }
}
