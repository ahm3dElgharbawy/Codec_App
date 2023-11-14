class CustomCrypto {
  static String encode({required String text, required int? key}) {
    if(key == null){
      return "the key should be a number";
    }
    List<int> asciCodes = [];
    for (int i = 0; i < text.length; i++) {
      asciCodes.add(text[i].codeUnitAt(0) + key);
    }
    return asciCodes.join(" ");
  }

  static String decode({required String encodedText, required int? key}) {
    if(key == null){
      return "the key should be a number";
    }
    List<int> asciCodes;
    try {
      asciCodes = encodedText.split(" ").map((e) => int.parse(e)).toList();
      for (int i = 0; i < asciCodes.length; i++) {
        asciCodes[i] -= key;
      }
    } catch (e) {
      return "text is not encrypted yet";
    }
    // catching errors that makes us so sad
    try {
      String text = String.fromCharCodes(asciCodes);
      return text; 
    } catch (e) {
      return "Invalid key or encrypted text";
    }
  }
}
