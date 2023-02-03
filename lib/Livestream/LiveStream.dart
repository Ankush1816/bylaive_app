// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:bylaive/Constants/colours.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// Package imports:
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';




class LiveStream extends StatelessWidget {
  const LiveStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text('Start a live'),
                    onPressed: () => jumpToLivePage(context, isHost: true),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text('Watch a live'),
                    onPressed: () => jumpToLivePage(context, isHost: false),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void jumpToLivePage(BuildContext context, {required bool isHost}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LivePage(isHost: isHost)),
    );
  }
}

final String userID = Random().nextInt(10000).toString();

class LivePage extends StatelessWidget {
  const LivePage({Key? key, this.isHost = false}) : super(key: key);
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: _mediaQueryData.size.height,
            child: ZegoUIKitPrebuiltLiveStreaming(
              appID: 1035941449,
              appSign: 'd181e90a4865d079a85f810eb0f61ef56ea16d338cd21d6899ca2f0853825e1a',
              userID: FirebaseAuth.instance.currentUser!.uid,
              userName: FirebaseAuth.instance.currentUser!.email.toString(),
              liveID: "testLiveID",
              config: isHost
                  ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
                  : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
            ),
          ),
      ],
      ),
    );
  }
}