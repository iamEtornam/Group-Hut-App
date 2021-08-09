import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:group_hut/resources/resources.dart';
import 'package:group_hut/shared/custom_button.dart';
import 'package:group_hut/shared/custom_colors.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

import 'shared/custom_app_bar.dart';
import 'shared/custom_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Hut',
      theme: customTheme(context),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          tabWidget: TabBar(
              tabs: [
                Tab(
                  text: 'Upcoming',
                ),
                Tab(text: 'Past'),
                Tab(text: 'Canceled'),
              ],
              labelStyle:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
              indicatorSize: TabBarIndicatorSize.label, //makes it better
              labelColor: Colors.white, //Google's sweet blue
              unselectedLabelColor:
                  Color.fromRGBO(125, 108, 215, 1), //niceish grey
              isScrollable: true, //up to your taste

              indicator: MD2Indicator(
                  //it begins here
                  indicatorHeight: 3,
                  indicatorColor: Colors.white,
                  indicatorSize: MD2IndicatorSize.tiny)),
        ),
        body: TabBarView(
          children: [
            UpcomingView(),
            PastView(),
            CanceledView(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          child: Center(
            child: Icon(
              Icons.add_box_rounded,
              color: Colors.white,
            ),
          ),
          width: 64,
          height: 64,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              gradient: LinearGradient(
                  colors: gradientColors.call(),
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
        ),
      ),
    );
  }
}

class UpcomingView extends StatelessWidget {
  UpcomingView({Key? key}) : super(key: key);

  final List<String> _images = [
    'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
    'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
    'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
            padding: EdgeInsets.only(left: 16, bottom: 74, right: 16, top: 16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventDetialsView())),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                          colors: gradientColors.call(),
                          begin: index.isEven
                              ? Alignment.bottomRight
                              : Alignment.topRight,
                          end: index.isEven
                              ? Alignment.topLeft
                              : Alignment.bottomRight)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wed, 15 Feb, 4PM - 5PM',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Daily meeting with team',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            FlutterImageStack(
                              imageList: _images,
                              showTotalCount: true,
                              totalCount: 3,
                              itemRadius: 60, // Radius of each images
                              itemCount:
                                  3, // Maximum number of images to be shown in stack
                              itemBorderWidth:
                                  3, // Border width around the images
                            ),
                            Spacer(),
                            CustomButton(onPressed: () {}, label: 'Join')
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (__, _) => SizedBox(
                  height: 15,
                ),
            itemCount: 2),
      ),
    );
  }
}

class PastView extends StatelessWidget {
  const PastView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class CanceledView extends StatelessWidget {
  const CanceledView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class EventDetialsView extends StatelessWidget {
  const EventDetialsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.image1,
            width: size.width,
            height: size.height /2,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: kToolbarHeight,),
                Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white30, width: 4),
                          borderRadius: BorderRadius.circular(45)),
                    ),
                    Spacer(),
                     Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Feather.send,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white30, width: 4),
                          borderRadius: BorderRadius.circular(45)),
                    ),
                     Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white30, width: 4),
                          borderRadius: BorderRadius.circular(45)),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
