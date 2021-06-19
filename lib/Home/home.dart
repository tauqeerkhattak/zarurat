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

class _HomeState extends State<Home> {
  bool sliverCollapsed = false;
  bool bottomVisible = true;
  ScrollController _controller = ScrollController();
  double counter = 0.0;
  TextEditingController searchController = TextEditingController();
  String selectedItem = 'Karachi';
  List <String> cities = [
    'Karachi',
    'Lahore',
    'Islamabad',
    'Sanghar',
    'Hyderabad',
  ];

  @override
  void initState() {
    _controller = ScrollController();

    _controller.addListener(() {
      counter = _controller.offset;
      if (_controller.offset > 23 && !_controller.position.outOfRange) {
        setState(() {
          bottomVisible = false;
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
      appBar: (bottomVisible)?AppBar(
        leading: Icon(
          Icons.dehaze,
        ),
        backgroundColor: Data.primaryColor,
        elevation: 0.0,
        title: Column(
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
        ),
      ):null,
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
                    expandedHeight: MediaQuery.of(context).size.height * 0.30,
                    collapsedHeight: MediaQuery.of(context).size.height * 0.10,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: FittedBox(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Container(
                            margin: EdgeInsets.only(left: 10,right: 10),
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