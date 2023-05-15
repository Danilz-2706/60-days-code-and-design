import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';

import '../constans/colors.dart';
import '../constans/responsive.dart';

// ignore: non_constant_identifier_names
ResponsiveLayoutCell BigTitle(
    {required BuildContext context, required String title}) {
  return ResponsiveLayoutCell(
    position: CellPosition.nextColumn(),
    columnSpan: ColumnSpan.size(
      MyResponsive.isDesktop(context)
          ? 12
          : MyResponsive.isTablet(context)
              ? 8
              : 4,
    ),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MyResponsive.isDesktop(context)
                ? 200
                : MyResponsive.isTablet(context)
                    ? 150
                    : 100,
            child: FittedBox(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: kBigTitleTextColor),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
