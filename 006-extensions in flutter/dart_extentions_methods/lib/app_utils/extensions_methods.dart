import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//! String Extension`
extension StringExtension on String {
  //***************** localization ****************** */
  //  String tr({BuildContext? context}) {
  //   return AppLocalizations.of(context)?.translate(this) ?? this;
  // }

//*****************  check is string is English  ****************** */
  bool startsWithEnglishLetter() {
    if (isEmpty) {
      return false;
    }
    int firstCodeUnit = codeUnitAt(0);

    // Check if the first character is an English uppercase or lowercase letter
    return (firstCodeUnit >= 65 && firstCodeUnit <= 90) || (firstCodeUnit >= 97 && firstCodeUnit <= 122);
  }

  //******* */ Check if the string is a valid URL ********
  bool isValidURL() {
    final RegExp urlRegex = RegExp(
      r'^(https?:\/\/)?([a-zA-Z0-9.-]+)(:[0-9]+)?(\/.*)?$',
    );
    return urlRegex.hasMatch(this);
  }

  //*** */ Capitalize the first letter of the string ********
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

//! Context Extension
extension ContextExtension on BuildContext {
  //**************** Navigation ****************** */
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<T?> push<T>(Widget page) {
    return Navigator.push(this, MaterialPageRoute(builder: (context) => page));
  }

  Future<T?> pushReplacementNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(String routeName, {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop<T>([T? result]) => Navigator.pop(this, result);

  // ***Access the scaffold messenger for showing snack bars **
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

//! numbers Extension
extension AppNumberExtension on num {
  //************ Padding *********************/
  EdgeInsets get allPadding => EdgeInsets.all(toDouble().r);
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: toDouble().h);
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: toDouble().w);

  //****************  borderRadius ****************** */
  BorderRadius get allBorderRadius => BorderRadius.circular(toDouble().r);
  BorderRadius get topBorderRadius => BorderRadius.vertical(top: Radius.circular(toDouble().r));
  BorderRadius get bottomBorderRadius => BorderRadius.vertical(bottom: Radius.circular(toDouble().r));

  //***************  dividers ****************** */
  Widget get verticalDivider => VerticalDivider(width: toDouble().w, thickness: 1);
  Widget get horizontalDivider => Divider(height: toDouble().h, thickness: 1);

  //****************  SizedBox ****************** */
  Widget get verticalSizedBox => SizedBox(height: toDouble().h);
  Widget get horizontalSizedBox => SizedBox(width: toDouble().w);
}

//! WidgetExtension
extension WidgetExtension on Widget {
  //************ Padding *********************/
  Widget horizontalPadding(double padding) => Padding(padding: EdgeInsets.symmetric(horizontal: padding.w), child: this);
  Widget verticalPadding(double padding) => Padding(padding: EdgeInsets.symmetric(vertical: padding.h), child: this);
  Widget allPadding(double padding) => Padding(padding: EdgeInsets.all(padding.r), child: this);
  Widget onlyPadding({double topPadding = 0, double bottomPadding = 0, double rightPadding = 0, double leftPadding = 0}) => Padding(padding: EdgeInsets.only(bottom: bottomPadding.h, left: leftPadding.w, right: rightPadding.w, top: topPadding.h), child: this);
  //****************  center ****************** */
  Widget center() => Center(child: this);

  //*** */ Wrap the widget with a ClipRRect ********
  Widget clipRRect({BorderRadius borderRadius = BorderRadius.zero}) => ClipRRect(
        borderRadius: borderRadius,
        child: this,
      );
}

//************ */ DateTime Extension *********************/
extension DateTimeExtension on DateTime {
  //************ */ format *********************/
  String format() {
    return "$day-$month-$year";
  }

  //************ */ isSameDay *********************/
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  //************ */ timeAgo *********************/
  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);

    if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? "مند اسبوع" : 'الاسبوع الماضي';
    } else if (difference.inDays >= 2) {
      return 'منذ ${difference.inDays} يوم';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? 'منذ 1 يوم' : 'الامس';
    } else if (difference.inHours >= 2) {
      return 'منذ ${difference.inHours} ساعة';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? 'منذ 1 ساعة' : 'ساعة واحدة مضت';
    } else if (difference.inMinutes >= 2) {
      return 'منذ ${difference.inMinutes} دقيقة';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? 'منذ دقية' : 'دقيقة واحدة مضت';
    } else if (difference.inSeconds >= 3) {
      return 'منذ ${difference.inSeconds} ثانية';
    } else {
      return 'الان';
    }
  }
}
