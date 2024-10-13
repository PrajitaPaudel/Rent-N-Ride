import 'package:flutter/material.dart';

import '../../../utils/constants/app_constant.dart';
import '../../../utils/constants/colors.dart';
import '../../common widget/tab_barwidget.dart';


class DTabBar extends StatelessWidget {
  const DTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TabBar(
          controller: tabController,
          indicator: BoxDecoration(
            color: TColors.subPrimary,
            borderRadius: BorderRadius.circular(25),

          ),
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          tabAlignment: TabAlignment.start,
          isScrollable:true,
          labelPadding:EdgeInsets.zero ,
          unselectedLabelStyle:TextStyle(color: TColors.darkGrey) ,
          labelStyle: TextStyle(color:Colors.white),
          tabs:List.generate(orderList.length, (index) {
            return TabWidget(text:orderList[index],);
          }),

          // return TabWidget(text:orderList[i]); ),
          // }




        )
    );
  }
}