class CommonUtilsClass {
  static CommonUtilsClass _instance = new CommonUtilsClass.internal();

  CommonUtilsClass.internal();

  factory CommonUtilsClass() => _instance;

  static String removeHtmlTags(String html) {
    String text = '';
    bool isInsideTag = false;

    for (int i = 0; i < html.length; i++) {
      if (html[i] == '<') {
        isInsideTag = true;
      } else if (html[i] == '>') {
        isInsideTag = false;
      } else if (!isInsideTag) {
        text += html[i];
      }
    }

    return text;
  }

}