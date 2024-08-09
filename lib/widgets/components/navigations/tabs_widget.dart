import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets_sample/widgets/components/component_decoration.dart';

class TabsWidget extends StatefulWidget {
  const TabsWidget({super.key});

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Tabs',
      tooltipMessage: 'Use TabBar',
      child: SizedBox(
        height: 80,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  icon: Icon(Icons.videocam_outlined),
                  text: 'Video',
                  iconMargin: EdgeInsets.only(bottom: 0.0),
                ),Tab(
                  icon: Icon(Icons.photo_outlined),
                  text: 'Photo',
                  iconMargin: EdgeInsets.only(bottom: 0.0),
                ),Tab(
                  icon: Icon(Icons.audiotrack_outlined),
                  text: 'Audio',
                  iconMargin: EdgeInsets.only(bottom: 0.0),
                ),
              ],
            ),
            // TODO: Showcase secondary tab bar https://github.com/flutter/flutter/issues/111962
          ),
        ),
      ),
    );
  }
}
