// import 'package:four_musti/model/chat_objectbox_model.dart';

// class DBHelpers {
//   static Future<int> insert(ChatsInfo chat) async {
//     var store = await ObjectBoxStore.getStore();
//     var box = store.box<ChatsInfo>();
//     return box.put(chat);
//   }

//   // static Future<bool> delete(int id) async {
//   //   var store = await ObjectBoxStore.getStore();
//   //   var box = store.box<ChatsInfo>();
//   //   return box.remove(id);
//   // }

//   static Future<ChatsInfo> queryPerson(String peerID) async {
//     var store = await ObjectBoxStore.getStore();
//     var box = store.box<ChatsInfo>();
//     return box.get(peerID);
//   }
// }
