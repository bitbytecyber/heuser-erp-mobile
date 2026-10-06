import 'package:flutter/widgets.dart';
import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

Future<List<String>> _fetch(String q, int offset) async => const [];

void main() {
  goldenPresetMatrix(
    'h_search_select',
    (context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HSearchSelect<String>(
          fetchPage: _fetch,
          labelOf: (s) => s,
          value: null,
          onChanged: (_) {},
          label: 'School',
          hint: 'Search your school',
          required: true,
        ),
        HSpace.gap3,
        HSearchSelect<String>(
          fetchPage: _fetch,
          labelOf: (s) => s,
          value: 'Karachi Grammar School',
          onChanged: (_) {},
          label: 'School',
          leadingIcon: HIcons.school,
        ),
        HSpace.gap3,
        HSearchSelect<String>(
          fetchPage: _fetch,
          labelOf: (s) => s,
          value: null,
          otherLabel: 'Beaconhouse (typed)',
          onChanged: (_) {},
          onOther: () {},
          label: 'School',
        ),
        HSpace.gap3,
        HSearchSelect<String>(
          fetchPage: _fetch,
          labelOf: (s) => s,
          value: null,
          onChanged: (_) {},
          label: 'City',
          error: 'Choose your city',
        ),
      ],
    ),
  );
}
