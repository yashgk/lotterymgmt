import 'package:lotto_mgmt/core/repo/entry_repo.dart';

import '../models/entry_model.dart';

class EntryService {
  EntryRepo entryRepo = EntryRepo();

  Future<List<Entry>?> getEntries(Map<String, String> filters) async {
    return await entryRepo.getEntries(filters);
  }

  Future<bool> setEntries(List<Entry> entryList) async {
    return await entryRepo.setEntries(entryList);
  }
}
