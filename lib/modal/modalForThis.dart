import 'package:hive/hive.dart';
part 'modalForThis.g.dart';

@HiveType(typeId: 0)
class whatsapp {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? subtext;
  @HiveField(2)
  int? phoneNumber;
  @HiveField(3)
  dynamic? image;
  whatsapp(
      {required this.name,
      required this.subtext,
      required this.phoneNumber,
      
      this.image});
}
