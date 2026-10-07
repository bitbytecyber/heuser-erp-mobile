// Result types of `TrackerRules`.

/// Which status card applies.
enum StatusKind {
  /// Withdrawn by the family.
  withdrawn,

  /// Not offered.
  notOffered,

  /// Closed by the office.
  closed,

  /// Enrolled.
  enrolled,

  /// Paid and verified.
  readyToEnroll,

  /// Proof of payment being checked.
  paymentChecking,

  /// Last proof rejected.
  paymentRejected,

  /// Voucher to pay.
  payVoucher,

  /// Offer expired.
  offerExpired,

  /// Offer declined.
  offerDeclined,

  /// Offer waiting.
  offered,

  /// Sports trial stage.
  sportsTrial,

  /// Interview done; decision pending.
  interviewDone,

  /// Interview booked.
  interviewBooked,

  /// Interview times open.
  bookInterview,

  /// Under review.
  reviewing;

  /// Ended or settled states get the "ok"/"x" treatment.
  bool get positive => this == enrolled || this == readyToEnroll;

  /// Ended states.
  bool get negative =>
      this == withdrawn || this == notOffered || this == closed;
}

/// The status card's facts.
class StatusCard {
  /// Creates the card.
  const StatusCard(this.kind, {this.at, this.missing = const []});

  /// Which card.
  final StatusKind kind;

  /// A date the copy mentions (withdrawn on, interview at).
  final DateTime? at;

  /// Titles of documents needed before the interview.
  final List<String> missing;
}

/// Documents task variants.
enum DocsTaskKind {
  /// The office asked for a clearer copy.
  replace,

  /// Some are needed before the interview.
  blocking,

  /// Some are still to send.
  toSend,

  /// Nothing needed now.
  allIn;

  /// Shown as a to-do (not done).
  bool get todo => this != allIn;
}

/// The Documents task's facts.
class DocsTask {
  /// Creates the task.
  const DocsTask(this.kind, {this.count = 0, this.names = const []});

  /// Variant.
  final DocsTaskKind kind;

  /// Number needed before the interview.
  final int count;

  /// Titles still to send.
  final List<String> names;
}

/// Interview task variants.
enum InterviewKind {
  /// In progress now.
  inProgress,

  /// Done.
  done,

  /// No-show, not released again.
  missed,

  /// Documents checked; times not open yet.
  waitingForTimes,

  /// Documents not checked yet.
  waitingForDocuments,

  /// Booked; one move left.
  bookedCanMove,

  /// Booked; already moved once.
  bookedFinal,

  /// Pick a time.
  book;

  /// Rendered locked (grey, no body).
  bool get locked =>
      this == missed || this == waitingForTimes || this == waitingForDocuments;

  /// Rendered done (check).
  bool get isDone =>
      this == inProgress ||
      this == done ||
      this == bookedCanMove ||
      this == bookedFinal;
}

/// The Interview task's facts.
class InterviewTask {
  /// Creates the task.
  const InterviewTask(this.kind, {this.at});

  /// Variant.
  final InterviewKind kind;

  /// The booked time, when there is one.
  final DateTime? at;
}
