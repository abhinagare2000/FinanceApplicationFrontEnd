import 'dart:io';

Future<Map<String, String>> loadEnvFile(String filePath) async {
  final file = File(filePath);
  final lines = await file.readAsLines();
  final Map<String, String> envVars = {};

  for (var line in lines) {
    if (line.trim().isEmpty || line.startsWith('#')) continue;
    final parts = line.split('=');
    if (parts.length == 2) {
      envVars[parts[0].trim()] = parts[1].trim();
    }
  }

  return envVars;
}