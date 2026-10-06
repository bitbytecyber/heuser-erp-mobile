import 'package:heuser_ds/heuser_ds.dart';

import '../helpers/golden.dart';

void main() {
  goldenPresetMatrix(
    'h_fee_table',
    (context) => const HCard(
      child: HFeeTable(
        rows: [
          HFeeRow(label: 'Admission fee', amount: 'PKR 25,000'),
          HFeeRow(
            label: 'Security deposit',
            amount: 'PKR 50,000',
            note: 'refundable',
          ),
          HFeeRow(label: 'Tuition', amount: 'PKR 35,000', note: 'monthly'),
          HFeeRow(
            label: 'Academic scholarship',
            amount: '− 25 %',
            tone: HTextTone.success,
          ),
        ],
        total: 'PKR 75,000',
      ),
    ),
  );
}
