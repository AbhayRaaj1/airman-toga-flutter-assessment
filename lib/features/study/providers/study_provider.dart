import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/study_service.dart';
import '../models/study_subject.dart';

final studyServiceProvider =
Provider(
      (ref) => StudyService(),
);

final studyProvider =
FutureProvider<List<StudySubject>>(
      (ref) async {
    return ref
        .read(studyServiceProvider)
        .getSubjects();
  },
);