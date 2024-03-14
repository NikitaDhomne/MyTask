import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  Map<int, List<int>> _selectedTimeIndices = {};

  Map<int, List<int>> get selectedTimeIndices => _selectedTimeIndices;

  String? _selectedFileName;

  String? get selectedFileName => _selectedFileName;

  void toggleSelectedTimeIndex(int dayIndex, int timeIndex) {
    if (_selectedTimeIndices.containsKey(dayIndex)) {
      if (_selectedTimeIndices[dayIndex]!.contains(timeIndex)) {
        _selectedTimeIndices[dayIndex]!.remove(timeIndex);
      } else {
        _selectedTimeIndices[dayIndex]!.add(timeIndex);
      }
    } else {
      _selectedTimeIndices[dayIndex] = [timeIndex];
    }
    notifyListeners();
  }

  void setSelectedFileName(String? fileName) {
    _selectedFileName = fileName;
    notifyListeners();
  }

  void deleteSelectedFile() {
    _selectedFileName = null;
    notifyListeners();
  }
}
