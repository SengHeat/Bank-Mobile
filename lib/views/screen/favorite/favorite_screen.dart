

import 'package:bank_mobile_app/theme/color_resources.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      key: const Key("draggable_home_key"),
      leading: SizedBox.shrink(),
      title: Text(
        "Favorite",
        style: TextStyle(
          color: ColorResources.getAppBarTextColor(context),
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Image.asset("assets/images/logo_acleda.png"),
          onPressed: () {
            // Action for search icon
          },
        ),
      ],
      alwaysShowLeadingAndAction: true,
      alwaysShowTitle: false,
      headerExpandedHeight: 0.35,
      headerWidget: _buildHeaderWidget(),
      backgroundColor: Colors.white,
      appBarColor: ColorResources.getPrimaryColor(context),
      curvedBodyRadius: 16,
      body: [
        _buildListView(),
      ],
      fullyStretchable: false,
      stretchTriggerOffset: 200,
      expandedBody: Container(
        color: Colors.grey[200],
        height: 200,
        child: const Center(
          child: Text(
            'Expanded Body Content',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      stretchMaxHeight: 0.9,
      bottomSheet: Container(
        height: 60,
        color: Colors.grey[300],
        child: const Center(child: Text('Bottom Sheet Content')),
      ),
      bottomNavigationBarHeight: kBottomNavigationBarHeight,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for FAB
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      physics: const BouncingScrollPhysics(),
      scrollController: _scrollController,
    );
  }

  Widget _buildHeaderWidget() {
    return  Container(
      color: ColorResources.getDarkGrey(context).withOpacity(0.4),
      height: 20,
      child: Center(
          child: Image.network("https://s3.ap-southeast-1.amazonaws.com/uploads-store/uploads/all/hv3GqmpMV4beMd5zloQruplspg4UhxUToGMVmqF9.png")
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white70,
          child: ListTile(
            leading: CircleAvatar(
              child: Text("$index"),
            ),
            title: const Text("List Item Title"),
            subtitle: const Text("List Item Subtitle"),
          ),
        );
      },
    );
  }
}
