import 'package:flutter/foundation.dart';

@immutable
class EditorStep {
  const EditorStep({required this.title, required this.description});

  final String title;
  final String description;
}

class EditorController extends ChangeNotifier {
  EditorController();

  final List<EditorStep> steps = const [
    EditorStep(
      title: '1) Import Video',
      description: 'Choose a source clip from the device gallery.',
    ),
    EditorStep(
      title: '2) Trim Video',
      description: 'Set start and end points for the final clip.',
    ),
    EditorStep(
      title: '3) Add Music',
      description: 'Pick a soundtrack and control output volume.',
    ),
    EditorStep(
      title: '4) Export',
      description: 'Render and save the edited video.',
    ),
  ];

  int _currentStepIndex = 0;

  int get currentStepIndex => _currentStepIndex;
  EditorStep get currentStep => steps[_currentStepIndex];

  bool get canGoNext => _currentStepIndex < steps.length - 1;
  bool get canGoBack => _currentStepIndex > 0;

  void next() {
    if (!canGoNext) {
      return;
    }

    _currentStepIndex++;
    notifyListeners();
  }

  void back() {
    if (!canGoBack) {
      return;
    }

    _currentStepIndex--;
    notifyListeners();
  }
}
