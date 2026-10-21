# CareerCraft API Documentation & Flutter Integration Guide

Welcome to the **CareerCraft API** documentation. This guide provides complete endpoint specifications, payload examples, and Flutter integration patterns for building the mobile application.

---

## 1. Network Configuration & Base URL

When developing with Flutter locally, the backend URL depends on your target testing platform:

| Platform | Base URL | Note |
| :--- | :--- | :--- |
| **Android Emulator** | `http://10.0.2.2:8000/api` | `10.0.2.2` maps to the host machine `localhost` |
| **iOS Simulator** | `http://127.0.0.1:8000/api` | Can use standard `localhost` |
| **Physical Device (WiFi)** | `http://<YOUR_LOCAL_IP>:8000/api` | Example: `http://192.168.1.15:8000/api` |
| **Production** | `https://your-domain.com/api` | HTTPS in production |

> **Starting Laravel Local Server:**
> To make it accessible across your local network and physical devices, run:
> ```bash
> php artisan serve --host=0.0.0.0 --port=8000
> ```

---

## 2. Global Headers & Authentication

All API requests must include standard JSON headers. Authenticated endpoints require the **Laravel Sanctum** Bearer token in the `Authorization` header.

### Headers
```http
Accept: application/json
Content-Type: application/json
Authorization: Bearer <YOUR_SANCTUM_TOKEN>
```

### Standard Error Response (Validation Error - 422)
```json
{
  "message": "The email has already been taken.",
  "errors": {
    "email": [
      "The email has already been taken."
    ]
  }
}
```

---

## 3. Endpoints Reference

### 🔐 Authentication

#### 1. Register User
- **Method:** `POST`
- **Endpoint:** `/register`
- **Access:** Public
- **Request Body:**
  ```json
  {
    "name": "Jane Doe",
    "email": "jane@example.com",
    "password": "password123",
    "role": "job_seeker" // Options: "job_seeker", "employer", "admin" (default: "job_seeker")
  }
  ```
- **Response (201 Created):**
  ```json
  {
    "token": "1|qXyZ...",
    "otp": "492810",
    "user": {
      "id": 1,
      "name": "Jane Doe",
      "email": "jane@example.com",
      "role": "job_seeker"
    }
  }
  ```

#### 2. Login
- **Method:** `POST`
- **Endpoint:** `/login`
- **Access:** Public
- **Request Body:**
  ```json
  {
    "email": "jane@example.com",
    "password": "password123"
  }
  ```
- **Response (200 OK):**
  ```json
  {
    "token": "2|kLmN...",
    "user": {
      "id": 1,
      "name": "Jane Doe",
      "email": "jane@example.com",
      "role": "job_seeker"
    }
  }
  ```

#### 3. Verify OTP
- **Method:** `POST`
- **Endpoint:** `/verify-otp`
- **Access:** Public *(Throttled: 5 attempts/min)*
- **Request Body:**
  ```json
  {
    "email": "jane@example.com",
    "otp": "492810"
  }
  ```
- **Response (200 OK):**
  ```json
  {
    "message": "OTP verified successfully.",
    "token": "3|aBcD...",
    "user": {
      "id": 1,
      "name": "Jane Doe",
      "email": "jane@example.com",
      "role": "job_seeker"
    }
  }
  ```

#### 4. Resend OTP
- **Method:** `POST`
- **Endpoint:** `/resend-otp`
- **Access:** Public *(Throttled: 3 attempts/min)*
- **Request Body:**
  ```json
  {
    "email": "jane@example.com"
  }
  ```
- **Response (200 OK):**
  ```json
  {
    "message": "OTP resent successfully.",
    "otp": "837194"
  }
  ```

#### 5. Logout
- **Method:** `POST`
- **Endpoint:** `/logout`
- **Access:** Bearer Token
- **Response (200 OK):**
  ```json
  {
    "message": "Logged out successfully"
  }
  ```

#### 6. Get Current Profile
- **Method:** `GET`
- **Endpoint:** `/profile`
- **Access:** Bearer Token
- **Response (200 OK):**
  ```json
  {
    "id": 1,
    "name": "Jane Doe",
    "email": "jane@example.com",
    "role": "job_seeker",
    "phone": "+1234567890",
    "headline": "Senior Flutter Developer",
    "location": "New York, USA",
    "skills": "Flutter, Dart, Firebase, REST APIs",
    "experience": "5 years in mobile development",
    "education": "B.S. in Computer Science",
    "company_name": null,
    "company_website": null,
    "company_description": null
  }
  ```

#### 7. Update Profile
- **Method:** `PUT`
- **Endpoint:** `/profile`
- **Access:** Bearer Token
- **Request Body:**
  ```json
  {
    "name": "Jane Doe",
    "phone": "+1234567890",
    "headline": "Senior Flutter Developer",
    "location": "New York, USA",
    "skills": "Flutter, Dart, Provider, Bloc",
    "experience": "5 years",
    "education": "BS CS",
    "company_name": "Tech Corp",
    "company_website": "https://techcorp.com",
    "company_description": "Building modern software"
  }
  ```
- **Response (200 OK):** Returns updated User model.

---

### 💼 Jobs & Companies (Public Browsing)

#### 1. List Jobs (Paginated with Filters)
- **Method:** `GET`
- **Endpoint:** `/jobs`
- **Access:** Public
- **Query Parameters:**
  - `page`: Page number (default: 1, 20 items per page)
  - `search`: Keyword matching `title`, `description`, or `location`
  - `category`: Category name (e.g., `Engineering`, `Design`)
  - `job_type` or `type`: `Full-time`, `Part-time`, `Remote`, `Contract`
  - `location`: Filter by location substring
- **Example:** `/jobs?search=Flutter&job_type=Remote&page=1`
- **Response (200 OK):**
  ```json
  {
    "current_page": 1,
    "data": [
      {
        "id": 10,
        "user_id": 2,
        "title": "Senior Flutter Developer",
        "description": "Looking for a seasoned Flutter developer...",
        "requirements": "3+ years Flutter experience...",
        "responsibilities": "Develop cross-platform apps...",
        "category": "Mobile Development",
        "job_type": "Remote",
        "location": "Remote - Worldwide",
        "salary_min": 70000,
        "salary_max": 95000,
        "salary": "$70k - $95k / year",
        "experience_level": "Senior",
        "status": "active",
        "deadline": "2026-12-31",
        "employer": {
          "id": 2,
          "name": "Acme Corp",
          "company_name": "Acme Inc.",
          "company_website": "https://acme.inc"
        }
      }
    ],
    "first_page_url": "...",
    "last_page": 3,
    "next_page_url": "...",
    "prev_page_url": null,
    "total": 50
  }
  ```

#### 2. Get Job Details
- **Method:** `GET`
- **Endpoint:** `/jobs/{id}`
- **Access:** Public
- **Response (200 OK):** Returns single job listing object with nested `employer`.

#### 3. List Companies
- **Method:** `GET`
- **Endpoint:** `/companies`
- **Access:** Public
- **Response (200 OK):**
  ```json
  [
    {
      "id": 2,
      "name": "Acme Corp",
      "company_name": "Acme Inc.",
      "company_website": "https://acme.inc",
      "company_description": "Innovating the future.",
      "location": "San Francisco, CA",
      "job_listings_count": 5
    }
  ]
  ```

#### 4. Get Company Details
- **Method:** `GET`
- **Endpoint:** `/companies/{id}`
- **Access:** Public
- **Response (200 OK):** Returns company details with all `job_listings` where `status = active`.

---

### 📄 Job Applications (Job Seeker)

#### 1. My Applications
- **Method:** `GET`
- **Endpoint:** `/my-applications`
- **Access:** Bearer Token
- **Response (200 OK):**
  ```json
  [
    {
      "id": 15,
      "job_listing_id": 10,
      "user_id": 1,
      "resume_path": "resumes/jane_resume.pdf",
      "cover_letter": "I am thrilled to apply...",
      "expected_salary": "$80,000",
      "status": "pending",
      "created_at": "2026-10-21T08:00:00.000000Z",
      "job_listing": {
        "id": 10,
        "title": "Senior Flutter Developer",
        "employer": {
          "id": 2,
          "company_name": "Acme Inc."
        }
      }
    }
  ]
  ```

#### 2. Apply for a Job
- **Method:** `POST`
- **Endpoint:** `/jobs/{id}/apply`
- **Access:** Bearer Token
- **Request Body:**
  ```json
  {
    "resume_path": "resumes/my_resume.pdf",
    "cover_letter": "Why I am a great fit...",
    "expected_salary": "$85,000"
  }
  ```
- **Response (201 Created):** Returns created application object.

#### 3. Withdraw Application
- **Method:** `DELETE`
- **Endpoint:** `/applications/{id}`
- **Access:** Bearer Token
- **Response (200 OK):**
  ```json
  {
    "message": "Application withdrawn successfully"
  }
  ```

---

### 🏢 Employer Management

#### 1. Employer Dashboard Stats
- **Method:** `GET`
- **Endpoint:** `/employer/dashboard`
- **Access:** Bearer Token
- **Response (200 OK):**
  ```json
  {
    "total_jobs": 12,
    "active_jobs": 8,
    "total_applicants": 45
  }
  ```

#### 2. List Employer's Posted Jobs
- **Method:** `GET`
- **Endpoint:** `/employer/jobs`
- **Access:** Bearer Token
- **Response (200 OK):** Returns array of jobs with `applications_count`.

#### 3. View Applicants for a Job
- **Method:** `GET`
- **Endpoint:** `/employer/jobs/{jobId}/applicants`
- **Access:** Bearer Token
- **Response (200 OK):** Returns list of applications with applicant `user` profile data.

#### 4. Post New Job
- **Method:** `POST`
- **Endpoint:** `/employer/jobs`
- **Access:** Bearer Token
- **Request Body:**
  ```json
  {
    "title": "Flutter Mobile Developer",
    "description": "Full job description...",
    "requirements": "State management, REST APIs...",
    "responsibilities": "Build UI and state...",
    "category": "Technology",
    "job_type": "Full-time",
    "location": "New York / Hybrid",
    "salary_min": 60000,
    "salary_max": 80000,
    "salary": "$60,000 - $80,000",
    "experience_level": "Mid-Level",
    "deadline": "2026-12-01"
  }
  ```
- **Response (201 Created):** Returns the created job listing.

#### 5. Update Job
- **Method:** `PUT`
- **Endpoint:** `/employer/jobs/{id}`
- **Access:** Bearer Token
- **Request Body:** Fields to update (e.g., `title`, `description`, etc.)
- **Response (200 OK):** Updated job listing.

#### 6. Delete Job
- **Method:** `DELETE`
- **Endpoint:** `/employer/jobs/{id}`
- **Access:** Bearer Token
- **Response (200 OK):** `{"message": "Job deleted successfully"}`

#### 7. Toggle Job Active/Closed Status
- **Method:** `PATCH`
- **Endpoint:** `/employer/jobs/{id}/toggle-status`
- **Access:** Bearer Token
- **Response (200 OK):** Returns job with updated `status` (`"active"` or `"closed"`).

#### 8. Update Application Status
- **Method:** `PATCH`
- **Endpoint:** `/employer/applications/{id}/status`
- **Access:** Bearer Token
- **Request Body:**
  ```json
  {
    "status": "shortlisted" // Options: "pending", "shortlisted", "rejected", "accepted"
  }
  ```
- **Response (200 OK):** Returns updated application record.

---

## 4. Flutter Integration Blueprint

### Recommended Dependencies (`pubspec.yaml`)
```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.7.0                     # Powerful HTTP client with interceptors
  flutter_secure_storage: ^9.2.2  # Encrypted storage for JWT/Sanctum tokens
  shared_preferences: ^2.3.2      # For app state/user preferences
```

### Dio Network Client Implementation (`lib/core/network/api_client.dart`)
```dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;

  late final Dio dio;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Dynamic Base URL based on platform
  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8000/api';
    } else {
      return 'http://127.0.0.1:8000/api';
    }
  }

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    // Attach Bearer Token Interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.read(key: 'auth_token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            // Handle unauthorized / expired token
            await _storage.delete(key: 'auth_token');
            // Navigate to login screen if appropriate
          }
          return handler.next(error);
        },
      ),
    );
  }

  // Token Helpers
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  Future<void> clearToken() async {
    await _storage.delete(key: 'auth_token');
  }
}
```

### Authentication Service Example (`lib/services/auth_service.dart`)
```dart
import 'package:dio/dio.dart';
import '../core/network/api_client.dart';

class AuthService {
  final ApiClient _client = ApiClient();

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      final token = response.data['token'];
      if (token != null) {
        await _client.saveToken(token);
      }
      return response.data;
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Login failed';
    }
  }

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    String role = 'job_seeker',
  }) async {
    try {
      final response = await _client.dio.post(
        '/register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'role': role,
        },
      );
      
      final token = response.data['token'];
      if (token != null) {
        await _client.saveToken(token);
      }
      return response.data;
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Registration failed';
    }
  }

  Future<void> logout() async {
    try {
      await _client.dio.post('/logout');
    } finally {
      await _client.clearToken();
    }
  }
}
```

---

## 5. Summary Checklist for Flutter Developers

- [ ] Ensure `php artisan serve --host=0.0.0.0 --port=8000` is running on your machine.
- [ ] For Android Emulator, verify network URL points to `http://10.0.2.2:8000/api`.
- [ ] For Physical Device, connect to same WiFi network and use host machine's IP (e.g. `http://192.168.x.x:8000/api`).
- [ ] Always check for `422 Unprocessable Content` response to display validation errors under text input fields.
- [ ] Persist the Sanctum Bearer token securely using `flutter_secure_storage`.
