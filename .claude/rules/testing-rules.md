# Testing rules

| Layer | Test type | Tooling | Required for |
|---|---|---|---|
| `core/**`, `features/*/domain/**` | unit | `flutter_test`, fixtures | every public function (coverage gate ≥ 80 %) |
| blocs | unit | `bloc_test` + `mocktail` fakes of abstract repos | every event handler, every failure branch |
| apis / repositories | unit | Dio `MockAdapter` or mocktail `Dio` | path, trailing slash, method, multipart fields, DTO parsing |
| interceptors | unit | ported sms-flutter tests | token rotation, stale rejection, retry policy |
| DS components | golden | `alchemist`, `goldenPresetMatrix` | every `h_*.dart` (CI script checks) |
| pages | widget | fake repositories | happy path + one failure per page |
| end to end | integration | `integration_test/` against local Django | nightly only |

Conventions:

- `test/` mirrors `lib/`; a test file is named after the unit it tests.
- API fixtures are real JSON captured from the backend, saved under
  `test/fixtures/<feature>/*.json`, never hand-typed shapes.
- Use `FakeAsync`/`fakeAsync` for debounce and timer logic; never
  `await Future.delayed` in tests.
- Goldens render with bundled fonts and platform goldens disabled so Windows,
  macOS and CI agree. Update intentionally with `make update-goldens` and
  include the PNG diff in the PR.
- Run `make check` before reporting done. A skipped or failing test is
  reported as such, never hidden.
