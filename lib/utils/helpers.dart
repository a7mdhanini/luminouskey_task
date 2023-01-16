dynamic testMap(
    Map<String, dynamic> documentsData, String key, dynamic replacement) {
  if (documentsData.containsKey(key)) {
    if (documentsData[key] != null) {
      return documentsData[key];
    } else {
      return replacement;
    }
  } else if (!documentsData.containsKey(key)) {
    return replacement;
  }
}
