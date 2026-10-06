# Bloc rules

- Events and states are **freezed sealed classes** (`@freezed sealed class`).
  Pattern-match with `switch` expressions; no `is` chains, no `copyWith` on
  sealed states (use a single-state class with `copyWith` only when the
  screen is a form with many orthogonal fields, e.g. `ApplicationFormState`).
- One bloc per screen responsibility. Sub-cubits (`InterviewTimesCubit`,
  `OfferPdfCubit`) are created lazily by the widget that needs them, inside a
  `BlocProvider`, and disposed with it.
- Blocs receive **abstract repositories** via constructor. Tests use mocktail
  fakes; no `getIt` inside a bloc.
- Use `bloc_concurrency` transformers deliberately: `sequential()` for
  anything that writes (autosave queue), `restartable()` for searches,
  `droppable()` for submit buttons. Document the choice in a comment.
- After an `await`, check `emit.isDone` / `isClosed` before emitting.
- Cancel every `StreamSubscription`, `Timer` and `Debouncer` in `close()`.
- A bloc never navigates and never shows a toast. It emits state; a
  `BlocListener` in the page performs navigation/toasts.
- Loading and failure are explicit states (or fields). A failure path always
  clears the loading flag.
- Skip redundant reloads unless `force: true`; pull-to-refresh and resume pass
  `force`.
- `Started` events are added by the route's `BlocProvider(create: (_) =>
  XBloc(...)..add(const XEvent.started()))`, never in `initState`.
- Log through `TalkerBlocObserver` only; no `print`.
