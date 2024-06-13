import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/ui/resources/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.child,
    required this.navigateToMain,
    required this.navigateToBookmark,
    required this.navigateToSearch,
  });

  final Widget child;
  final void Function() navigateToMain;
  final void Function() navigateToBookmark;
  final void Function() navigateToSearch;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          height: 70.0,
          elevation: 0,
          color: AppColors.black,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _navBarItem(
                  index: 0,
                  onTap: widget.navigateToMain,
                  context: context,
                  icon: _currentPage == 0
                      ? Assets.icons.home
                      : Assets.icons.homeOutline),
              _navBarItem(
                  index: 1,
                  onTap: widget.navigateToSearch,
                  context: context,
                  icon: _currentPage == 1
                      ? Assets.icons.search
                      : Assets.icons.searchOutline),
              _navBarItem(
                  index: 2,
                  onTap: widget.navigateToBookmark,
                  context: context,
                  icon: _currentPage == 2
                      ? Assets.icons.saved
                      : Assets.icons.savedOutline),
            ],
          ),
        ),
        body: widget.child);
  }

  Widget _navBarItem({
    required context,
    required icon,
    required onTap,
    required index,
  }) {
    return InkWell(
      onTap: _currentPage != index
          ? () {
              onTap();
              setState(() {
                _currentPage = index;
              });
            }
          : null,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        child: SvgPicture.asset(
          icon,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
