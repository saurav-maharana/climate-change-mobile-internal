import 'package:intl/intl.dart';

final dateNow = DateFormat('EEEE').format(DateTime.now());
final dateNow1 = DateFormat('EEEE')
    .format(DateTime.now().add(const Duration(days: 1)))
    .substring(0, 3);
final dateNow2 = DateFormat('EEEE')
    .format(DateTime.now().add(const Duration(days: 2)))
    .substring(0, 3);
final dateNow3 = DateFormat('EEEE')
    .format(DateTime.now().add(const Duration(days: 3)))
    .substring(0, 3);
final dateNow4 = DateFormat('EEEE')
    .format(DateTime.now().add(const Duration(days: 4)))
    .substring(0, 3);
final dateNow5 = DateFormat('EEEE')
    .format(DateTime.now().add(const Duration(days: 5)))
    .substring(0, 3);
final dateNow6 = DateFormat('EEEE')
    .format(DateTime.now().add(const Duration(days: 6)))
    .substring(0, 3);
final dateNow7 = DateFormat('EEEE')
    .format(DateTime.now().add(const Duration(days: 7)))
    .substring(0, 3);
