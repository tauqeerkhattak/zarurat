import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:zarurat/Models/search_bar.dart';

import '../data.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool appbarVisible = true;
  bool bottomVisible = true;
  ScrollController _controller = ScrollController();
  double counter = 0.0;
  TextEditingController searchController = TextEditingController();
  String selectedItem = 'Karachi';
  TabController? _tabController;
  List <String> cities = [
    'Karachi',
    'Lahore',
    'Islamabad',
    'Sanghar',
    'Hyderabad',
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this,initialIndex: 0);
    _controller = ScrollController();
    _controller.addListener(() {
      counter = _controller.offset;
      if (_controller.offset > 23 && !_controller.position.outOfRange) {
        setState(() {
          bottomVisible = false;
        });
      }
      if (_controller.offset > 70 && !_controller.position.outOfRange) {
        setState(() {
          appbarVisible = false;
        });
      }
      if (_controller.offset <= 70 && !_controller.position.outOfRange) {
        setState(() {
          appbarVisible = true;
        });
      }
      if (_controller.offset <= 23 && !_controller.position.outOfRange) {
        setState(() {
          bottomVisible = true;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            NestedScrollView(
              controller: _controller,
              floatHeaderSlivers: true,
              headerSliverBuilder: (BuildContext context,bool isInnerBoxSelected) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: (bottomVisible)?Colors.transparent:Data.primaryColor,
                    floating: false,
                    pinned: true,
                    expandedHeight: MediaQuery.of(context).size.height * 0.35,
                    collapsedHeight: MediaQuery.of(context).size.height * 0.10,
                    elevation: 8.0,
                    title: (appbarVisible)?Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Zarurat.com',
                            style: TextStyle(
                              color: Data.secondaryColor,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Here you will find ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Data.secondaryColor,
                              ),
                            ),
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  'excellency!',
                                  speed: Duration(milliseconds: 250),
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                TyperAnimatedText(
                                  'reliability!',
                                  speed: Duration(milliseconds: 250),
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                TyperAnimatedText(
                                  'productivity!',
                                  speed: Duration(milliseconds: 250),
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ):null,
                    leading: (appbarVisible)?IconButton(
                      icon: Icon(
                        Icons.dehaze,
                        color: Data.secondaryColor,
                      ),
                      onPressed: () {

                      },
                    ):null,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: FittedBox(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Container(
                            margin: EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 0),
                            child: InkWell(
                              onTap: () {
                                print('city tapped!');
                                SelectDialog.showModal(
                                  context,
                                  label: 'Please Select your City',
                                  selectedValue: selectedItem,
                                  items: cities,
                                  onChange: (selected) {
                                    setState(() {
                                      selectedItem = selected.toString();
                                    });
                                  }
                                );
                              },
                              child: IgnorePointer(
                                child: SearchBar(
                                  hintTxt: 'Search for Homes',
                                  controller: searchController,
                                  suffixText: selectedItem,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      background: Container(
                        decoration: BoxDecoration(
                          color: Data.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 200,
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Data.secondaryColor,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Data.primaryColor.withOpacity(0.5),
                              ),
                              child: TabBar(
                                controller: _tabController,
                                unselectedLabelColor: Data.secondaryColor,
                                labelColor: Data.primaryColor,
                                indicatorWeight: 2,
                                indicator: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  color: Data.secondaryColor,
                                ),
                                automaticIndicatorColorAdjustment: true,
                                tabs: [
                                  Tab(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Buy',
                                            style: TextStyle(
                                              color: Data.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Rent',
                                            style: TextStyle(
                                              color: Data.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    bottom: (!bottomVisible)?PreferredSize(
                      preferredSize: const Size.fromHeight(0.0),
                      child: Container(),
                    ):PreferredSize(
                      preferredSize: const Size.fromHeight(0.0),
                      child: Transform.translate(
                        offset: new Offset(0, 30),
                        child: Container(
                          color: Data.primaryColor,
                          child: Container(
                            height: (bottomVisible)?30:0,
                            decoration: BoxDecoration(
                              color: Data.secondaryColor,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(35),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: ListView(
                children: [
                  Container(
                    height: 500,
                    color: Data.secondaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget HomeBody () {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView(
        children: [

        ],
      ),
    );
  }
}