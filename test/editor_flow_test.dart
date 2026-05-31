import 'package:flutter_test/flutter_test.dart';
import 'package:livit/src/features/editor/editor_controller.dart';

void main() {
  group('EditorController', () {
    test('starts at first step', () {
      final controller = EditorController();

      expect(controller.currentStepIndex, 0);
      expect(controller.currentStep.title, '1) Import Video');
      expect(controller.canGoBack, isFalse);
      expect(controller.canGoNext, isTrue);
    });

    test('moves forward and backward within bounds', () {
      final controller = EditorController();

      controller.next();
      controller.next();
      expect(controller.currentStep.title, '3) Add Music');

      controller.back();
      expect(controller.currentStep.title, '2) Trim Video');

      controller.back();
      controller.back();
      expect(controller.currentStep.title, '1) Import Video');

      controller.next();
      controller.next();
      controller.next();
      controller.next();
      expect(controller.currentStep.title, '4) Export');
      expect(controller.canGoNext, isFalse);
    });
  });
}
