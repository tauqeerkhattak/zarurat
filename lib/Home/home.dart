import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarurat/Models/custom_dropdown.dart';
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
  List <DropdownMenuItem> cityDropdown = [
    DropdownMenuItem(
      value: 'Karachi',
      child: Text('Karachi'),
    ),
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
      body: SafeArea(
        child: Stack(
          children: [
            NestedScrollView(
              controller: _controller,
              headerSliverBuilder: (BuildContext context,bool isInnerBoxSelected) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: (bottomVisible)?Colors.transparent:Data.primaryColor,
                    floating: false,
                    pinned: true,
                    expandedHeight: 220,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: InkWell(
                        onTap: () {
                          // CustomDropdown(
                          //   dropdownItems: cityDropdown,
                          // );
                        },
                        child: SearchBar(
                          hintTxt: 'Search for Homes',
                          controller: searchController,
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