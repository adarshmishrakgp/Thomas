import 'package:flutter/foundation.dart';

/// Tab provider for managing tab state
/// Uses ValueNotifier for isolated state management
enum TabType {
  arbeitnehmer, // Employee/Job Seeker
  arbeitgeber, // Employer
  temporarburo, // Temporary Agency
}

class TabProvider extends ValueNotifier<TabType> {
  TabProvider() : super(TabType.arbeitnehmer);

  void setTab(TabType tab) {
    value = tab;
  }
}




