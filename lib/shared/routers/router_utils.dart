import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:reos_challenge/shared/models/models.dart';

void presentDetailScreen({required BuildContext context, required Book book}) {
  GoRouter.of(context).go('/book/${book.id}');
}
