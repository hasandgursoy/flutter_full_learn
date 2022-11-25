import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/303/feed_view.dart';

class TabbarAdvance extends StatefulWidget  {
  const TabbarAdvance({super.key});

  @override
  State<TabbarAdvance> createState() => _TabLearnViewState();
  
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// TickerProviderStateMixin TabController'ı sayfada kullanmamızı sağlıyor.
class _TabLearnViewState extends State<TabbarAdvance>
    with TickerProviderStateMixin{
  late final TabController _tabController;
  final double _notchMargin = 2;

  @override
  void initState() {
    // vsync yapısı TickerProviderStateMixin'den geliyor.
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          // Notch Margin ve Shape yapısın arkası gözüksün diye yaptık
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Burdaki animate işleminin gerçekleşmesi için tabController'ı controller olarak
              // çalışmasını istediğimiz tabbar yapısına vermeliyiz.
              _tabController.animateTo(_MyTabViews.home.index);
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              // FloatActionButton Etrafında bir kazı işlemi yapmış gibi bir görüntü verir
              notchMargin: _notchMargin,
              shape: const CircularNotchedRectangle(),
              child: TabBar(
                  // Tabbar genel olarak çok fazla özellikle geliyor Widget'ların içindeki yapıları icelemek çok elzem.
                  // Kesinlikle zamanla kurcalayarak öğrenebileceğimiz yapılar.
                  indicatorColor: Colors.white,
                  labelColor: Colors.amberAccent,
                  unselectedLabelColor: Colors.purple,
                  onTap: (value) {},
                  padding: EdgeInsets.zero,
                  controller: _tabController,
                  tabs: _MyTabViews.values
                      .map((e) => Tab(text: e.name))
                      .toList())),
          appBar: AppBar(
          ),
          body: _tabBarView(),
        ));
  }

  TabBar _myTabBar() {
    return TabBar(
        controller: _tabController,
        tabs: _MyTabViews.values
            .map((e) => Tab(
                  text: e.name,
                ))
            .toList());
  }

  TabBarView _tabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
      FeedView(),
      IconLearnView(),
      IconLearnView(),
      IconLearnView()
    ]);
  }
}

class _TabBarView extends StatelessWidget{
  const _TabBarView({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      // Scroll özellğini kapatıyoruz.
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.blueGrey,
        )
      ],
    );
  }
}

enum _MyTabViews { home, settings, profile, favorite }

extension _MyTabViewExtension on _MyTabViews {}
