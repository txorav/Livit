import 'package:flutter/material.dart';

import 'editor_controller.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key, this.controller});

  final EditorController? controller;

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  late final EditorController _controller;
  late final bool _ownsController;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _controller = widget.controller ?? EditorController();
    _controller.addListener(_onChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_onChange);
    if (_ownsController) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final step = _controller.currentStep;

    return Scaffold(
      appBar: AppBar(title: const Text('Livit Video Editor')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Build your edit one step at a time',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(step.title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(step.description),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _controller.canGoBack ? _controller.back : null,
                    child: const Text('Back'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: _controller.canGoNext ? _controller.next : null,
                    child: Text(_controller.canGoNext ? 'Next Step' : 'Done'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
