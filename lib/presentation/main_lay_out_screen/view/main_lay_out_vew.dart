import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../resources/assets_manger.dart';
import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';
import '../view_model/main_lay_out_view_model.dart';


class MainLayOut extends StatelessWidget {
  const MainLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainLayoutViewModel(),
      child: Consumer<MainLayoutViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: viewModel.currentScreen,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: _buildIcon(SVGAssets.explore, viewModel.selectedIndex == 0),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(SVGAssets.result, viewModel.selectedIndex == 1),
                  label: 'Result',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(SVGAssets.profile, viewModel.selectedIndex == 2),
                  label: 'Profile',
                ),
              ],
              currentIndex: viewModel.selectedIndex,
              onTap: viewModel.onItemTapped,
              backgroundColor: ColorsManager.white,
              selectedItemColor: ColorsManager.blueBase,
              unselectedItemColor: ColorsManager.grey.withOpacity(.8),
              iconSize: AppSize.s28,
              elevation: AppSize.s0,
            ),
          );
        },
      ),
    );
  }

  Widget _buildIcon(String assetName, bool isSelected) {
    return SvgPicture.asset(
      assetName,
      color: isSelected ? ColorsManager.blueBase : ColorsManager.grey.withOpacity(.8),
      width: AppSize.s28,
    );
  }
}