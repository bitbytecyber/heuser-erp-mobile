import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:heuser_erp_mobile/features/applications/data/models/intake_enums.dart';

part 'documents.freezed.dart';
part 'documents.g.dart';

/// One uploaded copy of a document.
@freezed
abstract class DocVersion with _$DocVersion {
  /// Creates a version.
  const factory DocVersion({
    required int id,
    String? file,
    @JsonKey(unknownEnumValue: VersionState.unknown)
    @Default(VersionState.pending)
    VersionState state,
    @Default('') String reason,
    @JsonKey(name: 'uploaded_at') @Default('') String uploadedAt,
    @JsonKey(name: 'reviewed_by') String? reviewedBy,
    @JsonKey(name: 'reviewed_at') String? reviewedAt,
  }) = _DocVersion;

  /// From JSON.
  factory DocVersion.fromJson(Map<String, dynamic> json) =>
      _$DocVersionFromJson(json);
}

/// A document slot on an application (`Application.documents[]`).
@freezed
abstract class DocSlot with _$DocSlot {
  /// Creates a slot.
  const factory DocSlot({
    required int id,
    @JsonKey(name: 'doc_type') required int docType,
    @Default('') String code,
    @Default('') String name,
    @Default('') String hint,
    @JsonKey(unknownEnumValue: DocStage.unknown)
    @Default(DocStage.optional)
    DocStage stage,
    int? result,
    @Default('') String activity,
    @Default(false) bool later,
    @JsonKey(unknownEnumValue: DocSlotState.unknown)
    @Default(DocSlotState.missing)
    DocSlotState state,
    @Default('') String reason,
    @Default(<DocVersion>[]) List<DocVersion> versions,
  }) = _DocSlot;
  const DocSlot._();

  /// From JSON.
  factory DocSlot.fromJson(Map<String, dynamic> json) =>
      _$DocSlotFromJson(json);

  /// At least one file was sent.
  bool get hasFile => versions.isNotEmpty;
}

/// A document type the cycle asks for (`FormOptions.document_types[]`).
@freezed
abstract class DocumentType with _$DocumentType {
  /// Creates a type.
  const factory DocumentType({
    required int id,
    required String code,
    @Default('') String name,
    @Default('') String hint,
    @JsonKey(unknownEnumValue: DocStage.unknown)
    @Default(DocStage.optional)
    DocStage stage,
    @JsonKey(name: 'per_subject') @Default(false) bool perSubject,
    @JsonKey(name: 'blocks_interview') bool? blocksInterview,
  }) = _DocumentType;

  /// From JSON.
  factory DocumentType.fromJson(Map<String, dynamic> json) =>
      _$DocumentTypeFromJson(json);
}
