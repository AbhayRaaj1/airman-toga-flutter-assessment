import 'sync_status.dart';

class StudyNote {
  final String id;
  final String subject;
  final String content;
  SyncStatus status;

  StudyNote({
    required this.id,
    required this.subject,
    required this.content,
    required this.status,
  });

  factory StudyNote.fromJson(
      Map<String, dynamic> json) {
    return StudyNote(
      id: json["id"],
      subject: json["subject"],
      content: json["content"],
      status: SyncStatus.values[
      json["status"]],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "subject": subject,
      "content": content,
      "status": status.index,
    };
  }
}