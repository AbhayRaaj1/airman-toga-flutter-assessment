import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/subject_detail_service.dart';
import '../models/chapter.dart';

final subjectDetailServiceProvider =
Provider(
      (ref) =>
      SubjectDetailService(),
);

final chaptersProvider =
FutureProvider<List<Chapter>>(
      (ref) async {
    return ref
        .read(
        subjectDetailServiceProvider)
        .getChapters();
  },
);