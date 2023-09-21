import 'package:lotto_mgmt/core/network/network_helper.dart';
import '../models/entry_model.dart';

class EntryRepo {
  NetworkService networkService = NetworkService();

  Future<List<Entry>> getEntries(Map<String, String> filters) async {
    List<Entry> entries = [];
    try {
      var response = await networkService.get(
          "/entry/get?userid=${filters['userid']}&date=${filters['date']}");
      if (response.isNotEmpty) {
        List<Map<String, dynamic>> data = response['data'];
        for (var i = 0; i < data.length; i++) {
          entries.add(Entry.fromJson(data[i]));
        }
      }
    } catch (e) {
      rethrow;
    }
    return entries;
  }

  Future<bool> setEntries(List<Entry> entryList) async {
    bool isSetSuccess = false;
    try {
      var response =
          await networkService.post("/entry/add", {"entries": entryList});
      if (response.isNotEmpty) {
        if (response['message'] == "Entry Created Successfully!") {
          isSetSuccess = true;
        }
      }
    } catch (e) {
      rethrow;
    }
    return isSetSuccess;
  }
}
