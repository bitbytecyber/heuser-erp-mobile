/// Constants of the three-step form (`components/apply/form-model.ts`).
abstract final class FormRules {
  /// Steps in the form.
  static const stepCount = 3;

  /// A-Level subjects: at least this many.
  static const minSubjects = 3;

  /// A-Level subjects: at most this many.
  static const maxSubjects = 5;

  /// An applicant may have sat only a few papers so far; one result is enough.
  static const minResults = 1;

  /// Statement length, in words.
  static const minWords = 80;

  /// Statement length, in words.
  static const maxWords = 300;

  /// Latest year of birth accepted (31 Dec, twelve years back).
  static int dobMaxYear([DateTime? now]) => (now ?? DateTime.now()).year - 12;

  /// Common O-Level subjects, in the order offered.
  static const olSubjects = [
    'Mathematics',
    'English Language',
    'Urdu',
    'Islamiyat',
    'Pakistan Studies',
    'Physics',
    'Chemistry',
    'Biology',
    'Computer Science',
    'Additional Mathematics',
    'Economics',
    'Accounting',
    'Business Studies',
    'Sociology',
    'English Literature',
    'Commerce',
    'Art & Design',
    'Environmental Management',
    'Statistics',
    'First Language English',
  ];

  /// Quick-add subjects (the first eight).
  static const quick = [
    'Mathematics',
    'English Language',
    'Urdu',
    'Islamiyat',
    'Pakistan Studies',
    'Physics',
    'Chemistry',
    'Biology',
  ];

  /// Grades. `U` is a fail: offered for results that are out, never predicted.
  static const grades = ['A*', 'A', 'B', 'C', 'D', 'E', 'U'];

  /// Grades offered for a result still awaited (no `U`).
  static const predictedGrades = ['A*', 'A', 'B', 'C', 'D', 'E'];

  /// Sport levels.
  static const sportLevels = [
    'School',
    'Inter-school',
    'City',
    'Provincial',
    'National',
    'International',
  ];

  /// Other activities offered as chips.
  static const activities = [
    'Debating',
    'MUN',
    'Community service',
    'Music',
    'Art',
    'Drama',
    'Coding / robotics',
    'Student council',
    'Writing / journalism',
    'Olympiads',
    'Entrepreneurship',
    'Scouts / Guides',
  ];

  /// Guardian relations.
  static const relations = ['Father', 'Mother', 'Guardian'];

  /// Marital statuses.
  static const maritalStatuses = [
    'Married',
    'Separated',
    'Divorced',
    'Widowed',
    'Single',
  ];

  /// Work values (wire) with their labels.
  static const workOptions = {
    'Employed': 'Employed',
    'Self-employed': 'Own business',
    'Unemployed': 'Not working',
    'Retired': 'Retired',
  };

  /// Religions.
  static const religions = [
    'Islam',
    'Christianity',
    'Hinduism',
    'Sikhism',
    'Other',
  ];

  /// Months of an exam sitting.
  static const sittingMonths = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// Years to pick a sitting from (next year back eight).
  static List<int> sittingYears([DateTime? now]) {
    final y = (now ?? DateTime.now()).year;
    return [for (var k = 0; k < 8; k++) y + 1 - k];
  }

  /// "Studied there from" years (this year back fourteen).
  static List<int> fromYears([DateTime? now]) {
    final y = (now ?? DateTime.now()).year;
    return [for (var i = 0; i < 14; i++) y - i];
  }

  /// "Until" years (last year, this year, next year).
  static List<int> toYears([DateTime? now]) {
    final y = (now ?? DateTime.now()).year;
    return [y - 1, y, y + 1];
  }

  /// `Jun 2026`, or `''` without both parts.
  static String sessionLabel(int? month, int? year) {
    if (month == null || year == null || month < 1 || month > 12) return '';
    return '${sittingMonths[month - 1]} $year';
  }

  /// Words in [text] (runs of non-space).
  static int wordCount(String text) => RegExp(r'\S+').allMatches(text).length;

  /// Common degree routes, as suggestions for "What might you study after?".
  static const studyFields = [
    'Medicine (MBBS)',
    'Dentistry (BDS)',
    'Pharmacy',
    'Nursing',
    'Biotechnology',
    'Biomedical Engineering',
    'Computer Science',
    'Software Engineering',
    'Artificial Intelligence',
    'Data Science',
    'Cyber Security',
    'Electrical Engineering',
    'Mechanical Engineering',
    'Civil Engineering',
    'Chemical Engineering',
    'Aerospace Engineering',
    'Mechatronics',
    'Business Administration (BBA)',
    'Accounting & Finance',
    'Economics',
    'Actuarial Science',
    'Marketing',
    'Law (LLB)',
    'International Relations',
    'Political Science',
    'Psychology',
    'Media & Communication',
    'Architecture',
    'Design',
    'Fine Arts',
    'Mathematics',
    'Physics',
    'Environmental Science',
    'Aviation',
    'Hospitality Management',
  ];

  /// Title Case for a typed subject ("marine science" → "Marine Science").
  static String titleCase(String v) => v
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim()
      .split(' ')
      .map(
        (w) => w.isEmpty
            ? w
            : '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}',
      )
      .join(' ');

  /// First letter upper-cased, the rest kept.
  static String capFirst(String v) {
    final t = v.replaceAll(RegExp(r'\s+'), ' ').trim();
    return t.isEmpty ? t : '${t[0].toUpperCase()}${t.substring(1)}';
  }
}
