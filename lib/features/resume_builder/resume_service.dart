import '../../../core/network/api_service.dart';
import '../../../core/constants/api_endpoints.dart';
import 'models/resume_model.dart';

/// Service layer for resume CRUD operations against Laravel backend.
class ResumeService {
  ResumeService._();
  static final ResumeService instance = ResumeService._();

  final _api = ApiService.instance;

  // ─── Fetch All Resumes ────────────────────────────────────────────────────

  /// GET /api/resumes
  Future<ResumeListResult> getResumes() async {
    final response = await _api.get(ApiEndpoints.resumes);

    if (response.isSuccess && response.data != null) {
      final raw = response.data!;
      final List<dynamic> items =
          raw['data'] as List<dynamic>? ?? raw['resumes'] as List<dynamic>? ?? [];
      final resumes = items
          .whereType<Map<String, dynamic>>()
          .map(ResumeModel.fromJson)
          .toList();
      return ResumeListResult.success(resumes);
    }
    return ResumeListResult.failure(response.error ?? 'Failed to load resumes');
  }

  // ─── Fetch Single Resume ──────────────────────────────────────────────────

  /// GET /api/resumes/{id}
  Future<ResumeResult> getResume(int id) async {
    final response = await _api.get('${ApiEndpoints.resumes}/$id');

    if (response.isSuccess && response.data != null) {
      final raw = response.data!;
      final resumeJson = raw['data'] as Map<String, dynamic>? ?? raw;
      return ResumeResult.success(ResumeModel.fromJson(resumeJson));
    }
    return ResumeResult.failure(response.error ?? 'Resume not found');
  }

  // ─── Create Resume ────────────────────────────────────────────────────────

  /// POST /api/resumes
  Future<ResumeResult> createResume(ResumeModel resume) async {
    final response = await _api.post(ApiEndpoints.resumes, resume.toJson());

    if (response.isSuccess && response.data != null) {
      final raw = response.data!;
      final resumeJson = raw['data'] as Map<String, dynamic>? ?? raw;
      return ResumeResult.success(ResumeModel.fromJson(resumeJson));
    }
    return ResumeResult.failure(response.error ?? 'Failed to create resume');
  }

  // ─── Update Resume ────────────────────────────────────────────────────────

  /// PUT /api/resumes/{id}
  Future<ResumeResult> updateResume(ResumeModel resume) async {
    if (resume.id == null) return ResumeResult.failure('Resume has no ID');

    final response =
        await _api.put('${ApiEndpoints.resumes}/${resume.id}', resume.toJson());

    if (response.isSuccess && response.data != null) {
      final raw = response.data!;
      final resumeJson = raw['data'] as Map<String, dynamic>? ?? raw;
      return ResumeResult.success(ResumeModel.fromJson(resumeJson));
    }
    return ResumeResult.failure(response.error ?? 'Failed to update resume');
  }

  // ─── Save (Create or Update) ──────────────────────────────────────────────

  /// Automatically picks create or update based on whether resume has an id.
  Future<ResumeResult> saveResume(ResumeModel resume) {
    return resume.id != null ? updateResume(resume) : createResume(resume);
  }

  // ─── Delete Resume ────────────────────────────────────────────────────────

  /// DELETE /api/resumes/{id}
  Future<String?> deleteResume(int id) async {
    final response = await _api.delete('${ApiEndpoints.resumes}/$id');
    if (response.isSuccess) return null;
    return response.error ?? 'Failed to delete resume';
  }
}

// ─── Result Classes ────────────────────────────────────────────────────────

class ResumeListResult {
  final List<ResumeModel> resumes;
  final String? error;

  const ResumeListResult._({required this.resumes, this.error});

  bool get isSuccess => error == null;

  factory ResumeListResult.success(List<ResumeModel> resumes) =>
      ResumeListResult._(resumes: resumes);

  factory ResumeListResult.failure(String error) =>
      ResumeListResult._(resumes: const [], error: error);
}

class ResumeResult {
  final ResumeModel? resume;
  final String? error;

  const ResumeResult._({this.resume, this.error});

  bool get isSuccess => error == null;

  factory ResumeResult.success(ResumeModel resume) => ResumeResult._(resume: resume);
  factory ResumeResult.failure(String error) => ResumeResult._(error: error);
}
