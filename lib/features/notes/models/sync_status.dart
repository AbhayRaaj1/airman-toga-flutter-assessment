enum SyncStatus {
  pending,
  syncing,
  synced,
  failed,
}

extension SyncStatusExtension on SyncStatus {
  String get label {
    switch (this) {
      case SyncStatus.pending:
        return "Pending Sync";
      case SyncStatus.syncing:
        return "Syncing";
      case SyncStatus.synced:
        return "Synced";
      case SyncStatus.failed:
        return "Failed";
    }
  }
}