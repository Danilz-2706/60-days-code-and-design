import 'package:flutter/material.dart';
import 'package:responsive_layout_grid/responsive_layout_grid.dart';

import '../../model/font-end/animated_positioned.dart';
import '../../model/font-end/text_about.dart';
import '../components/image_card.dart';
import '../components/item_card.dart';
import '../components/text_card.dart';
import 'responsive.dart';

ResponsiveLayoutGrid gridSystemMyApp(
    BuildContext context, List<Widget> listWidget) {
  return ResponsiveLayoutGrid(
    minimumColumnWidth: MyResponsive.isDesktop(context)
        ? 74
        : MyResponsive.isTablet(context)
            ? 94
            : 90,
    padding: const EdgeInsets.symmetric(horizontal: 22.0),
    rowGutterHeight: MyResponsive.isDesktop(context)
        ? 14.0
        : MyResponsive.isTablet(context)
            ? 8.0
            : 16.0,
    columnGutterWidth: MyResponsive.isDesktop(context)
        ? 14.0
        : MyResponsive.isTablet(context)
            ? 8.0
            : 16.0,
    maxNumberOfColumns: MyResponsive.isDesktop(context)
        ? 12
        : MyResponsive.isTablet(context)
            ? 8
            : 4,
    children: listWidget,
  );
}

ResponsiveLayoutCell item25(BuildContext context,
    {List<MyAnimatedPositioned>? list,
    VoidCallback? press,
    bool? overFlow,
    List<TextAbout>? listTextAbout,
    String? image,
    double? sizeImage,
    Widget? widget}) {
  return ResponsiveLayoutCell(
    position: CellPosition.nextColumn(),
    columnSpan: ColumnSpan.size(
      MyResponsive.isDesktop(context)
          ? 3
          : MyResponsive.isTablet(context)
              ? 2
              : 4,
    ),
    child: list != null && press != null
        ? ItemCard(
            list: list,
            press: press,
          )
        : list != null && press == null
            ? ItemCard(
                list: list,
                press: null,
              )
            : listTextAbout != null && overFlow != null
                ? TextCard(
                    listTextAbout: listTextAbout,
                    overFlow: overFlow,
                  )
                : image != null
                    ? ImageCard(
                        pic: image,
                        size: sizeImage,
                      )
                    : widget ?? Container(),
  );
}

ResponsiveLayoutCell item50(BuildContext context,
    {List<MyAnimatedPositioned>? list,
    VoidCallback? press,
    bool? overFlow,
    List<TextAbout>? listTextAbout,
    String? image,
    double? sizeImage,
    Widget? widget}) {
  return ResponsiveLayoutCell(
    position: CellPosition.nextColumn(),
    columnSpan: ColumnSpan.size(
      MyResponsive.isDesktop(context)
          ? 6
          : MyResponsive.isTablet(context)
              ? 8
              : 4,
    ),
    child: list != null && press != null
        ? ItemCard(
            list: list,
            press: press,
          )
        : list != null && press == null
            ? ItemCard(
                list: list,
                press: null,
              )
            : listTextAbout != null && overFlow != null
                ? TextCard(
                    listTextAbout: listTextAbout,
                    overFlow: overFlow,
                  )
                : image != null
                    ? ImageCard(
                        pic: image,
                        size: sizeImage,
                      )
                    : widget ?? Container(),
  );
}

ResponsiveLayoutCell item75(BuildContext context,
    {List<MyAnimatedPositioned>? list,
    VoidCallback? press,
    bool? overFlow,
    List<TextAbout>? listTextAbout,
    String? image,
    double? sizeImage,
    Widget? widget}) {
  return ResponsiveLayoutCell(
    position: CellPosition.nextColumn(),
    columnSpan: ColumnSpan.size(
      MyResponsive.isDesktop(context)
          ? 9
          : MyResponsive.isTablet(context)
              ? 6
              : 4,
    ),
    child: list != null && press != null
        ? ItemCard(
            list: list,
            press: press,
          )
        : list != null && press == null
            ? ItemCard(
                list: list,
                press: null,
              )
            : listTextAbout != null && overFlow != null
                ? TextCard(
                    listTextAbout: listTextAbout,
                    overFlow: overFlow,
                  )
                : image != null
                    ? ImageCard(
                        pic: image,
                        size: sizeImage,
                      )
                    : widget ?? Container(),
  );
}

ResponsiveLayoutCell item100(BuildContext context,
    {List<MyAnimatedPositioned>? list,
    VoidCallback? press,
    bool? overFlow,
    List<TextAbout>? listTextAbout,
    String? image,
    double? sizeImage,
    Widget? widget}) {
  return ResponsiveLayoutCell(
    position: CellPosition.nextColumn(),
    columnSpan: ColumnSpan.size(
      MyResponsive.isDesktop(context)
          ? 12
          : MyResponsive.isTablet(context)
              ? 8
              : 4,
    ),
    child: list != null && press != null
        ? ItemCard(
            list: list,
            press: press,
          )
        : list != null && press == null
            ? ItemCard(
                list: list,
                press: null,
              )
            : listTextAbout != null && overFlow != null
                ? TextCard(
                    listTextAbout: listTextAbout,
                    overFlow: overFlow,
                  )
                : image != null
                    ? ImageCard(
                        pic: image,
                        size: sizeImage,
                      )
                    : widget ?? Container(),
  );
}
