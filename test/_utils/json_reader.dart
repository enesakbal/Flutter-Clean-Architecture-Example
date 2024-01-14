import 'dart:convert';
import 'dart:io';

/// Reads a JSON file with the given [name] and returns the decoded JSON object.
/// The [name] should be the relative path of the JSON file from the current directory.
///
/// Example usage:
/// ```dart
/// dynamic data = jsonReader('data.json');
/// ```
dynamic jsonReader(String name) {
  final dir = Directory.current.path;

  return jsonDecode(File('$dir/test/_utils/_dummy/$name').readAsStringSync());
}
