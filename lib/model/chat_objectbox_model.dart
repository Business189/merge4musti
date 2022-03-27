import 'package:objectbox/objectbox.dart';

@Entity()
class ChatsInfo {
  String? message;
  String? peerId;
  int? id;

  ChatsInfo({
    this.message,
    this.peerId,
  });
}
