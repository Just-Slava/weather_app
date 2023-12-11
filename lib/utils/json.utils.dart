class JsonUtils {
  static T getValueOrDefault<T>(Map<String, dynamic>? json, String key, T defaultValue) {
    if (json != null && json.containsKey(key)) {
      final dynamic value = json[key];

      if (value != null) {
        // Convert the value to the desired type
        if (T == int) {
          return _castToInt(value) as T;
        } else if (T == double) {
          return _castToDouble(value) as T;
        } else if (T == String) {
          return _castToString(value) as T;
        }

        // If T is not int, double, or String, return the value as is
        return value as T;
      }
    }

    return defaultValue;
  }

  static int? _castToInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.round();
    }
    return null;
  }

  static double? _castToDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    }
    return null;
  }

  static String? _castToString(dynamic value) {
    if (value is! String) {
      return value.toString();
    }
    return value;
  }
}
