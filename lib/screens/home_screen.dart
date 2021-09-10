import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone_app/models/channel_info.dart';
import 'package:youtube_clone_app/util/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  late ChannelInfo _channelInfo;
  late Item _item;
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _getChannelInfo();
  }

  _getChannelInfo() async {
    _channelInfo = await Services.getChannelInfo();
    _item = _channelInfo.items[0];
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Clone'),
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            children: [_buildInfoView()],
          )),
    );
  }

  _buildInfoView() {
    return _loading
        ? CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                child: Card(
                    child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      _item.snippet.thumbnails.medium.url,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      _item.snippet.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(_item.statistics.videoCount),
                  const SizedBox(width: 20),
                ],
              ),
            ))),
          );
  }
}
