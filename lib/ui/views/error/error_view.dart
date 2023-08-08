import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'error_viewmodel.dart';

class ErrorView extends StackedView<ErrorViewModel> {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ErrorViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline),
            Text(
              'Oups! Something went wrong!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
            SizedBox(height: 12),
            Text(
              "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ErrorViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ErrorViewModel();
}
