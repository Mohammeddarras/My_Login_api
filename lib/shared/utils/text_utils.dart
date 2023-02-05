class TextUtils {
  static bool isEmpty(final String? source) {
    return source == null || source.isEmpty;
  }

  static bool isNotEmpty(final String? source) {
    // return !isEmpty(source);
    return !isEmpty(source) && source != null;
  }

}
