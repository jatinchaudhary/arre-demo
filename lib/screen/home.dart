import 'dart:ui';
import 'package:demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isTrackBarVisible = false;

  void showModel(BuildContext ctx) {
    _scaffoldKey.currentState?.showBottomSheet<void>(
          (BuildContext context) {
            return Container(
                margin: const EdgeInsets.only(top: 1),
                padding: const EdgeInsets.only(top: 5),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: Constant.darkBlack),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SizedBox(
                            width:
                                (MediaQuery.of(context).size.width / 20) * 12,
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'How to make your business grow',
                                  style: TextStyle(
                                      color: Constant.textWhite,
                                      fontSize: 14,
                                      fontFamily: "Ubuntu",
                                      fontWeight: FontWeight.w400),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "@ShellyShah",
                                  style: TextStyle(
                                      color: Constant.textCyan,
                                      fontSize: 12,
                                      fontFamily: "Hind",
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "asset/icon/heart_icon.svg",
                                height: 32,
                                width: 32,
                              ),
                              SvgPicture.asset(
                                "asset/icon/play_button_icon.svg",
                                height: 48,
                                width: 48,
                              ),
                              SvgPicture.asset(
                                "asset/icon/menu_icon.svg",
                                height: 32,
                                width: 32,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 3,
                          width: MediaQuery.of(context).size.width / 3,
                          color: Constant.textCyan,
                        ),
                        Container(
                          height: 3,
                          width: (MediaQuery.of(context).size.width / 3) * 2,
                          color: Constant.textCyanDark,
                        )
                      ],
                    )
                  ],
                ));
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          backgroundColor: Constant.bgColor,
        )
        .closed
        .whenComplete(() {
          setState(() {
            _isTrackBarVisible = false;
          });
        });

    //controller.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Constant.darkBlack,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Adjust the height here
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Constant.darkBlack.withOpacity(0.7),
              ),
              child: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            "asset/icon/arre_logo.svg",
                            height: 16,
                            width: 46,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SvgPicture.asset(
                            "asset/icon/voice_logo.svg",
                            height: 15,
                            width: 45,
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        "asset/icon/bell_icon.svg",
                        height: 30,
                        width: 30,
                      ),
                      SvgPicture.asset(
                        "asset/icon/chat_icon.svg",
                        height: 30,
                        width: 30,
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  _isTrackBarVisible = true;
                  showModel(context);
                });
              },
              child: Container(
                width: double.infinity,
                child: Image.asset("asset/image/card.png"),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(height: 15);
          },
          itemCount: 15),
      bottomNavigationBar: ClipRRect(
        borderRadius: _isTrackBarVisible
            ? BorderRadius.zero
            : const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
        child: BackdropFilter(
          filter: _isTrackBarVisible
              ? ImageFilter.blur()
              : ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 62,
            decoration: BoxDecoration(
              color: _isTrackBarVisible
                  ? Constant.shadeBlack
                  : Constant.darkBlack
                      .withOpacity(0.7), // Background color of the AppBar
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "asset/icon/home_icon.svg",
                    height: 28,
                    width: 28,
                  ),
                  SvgPicture.asset(
                    "asset/icon/search_icon.svg",
                    height: 28,
                    width: 28,
                  ),
                  SvgPicture.asset(
                    "asset/icon/create_button.svg",
                    height: 48,
                    width: 48,
                  ),
                  SvgPicture.asset(
                    "asset/icon/people_icon.svg",
                    height: 28,
                    width: 28,
                  ),
                  Image.asset("asset/image/Avatar.png")
                ]),
          ),
        ),
      ),
    );
  }
}
