import 'package:common/common.dart';
import 'package:flutter/material.dart';

class OfferDetailTable extends StatelessWidget {
  const OfferDetailTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: DataTable(
          headingRowHeight: 50,
          headingTextStyle: context.twelve600,
          headingRowColor: WidgetStateProperty.all(context.grey100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: context.grey300),
          ),
          columns: const [
            DataColumn(
              label: Expanded(
                child: Text(
                  'Offer By',
                ),
              ),
            ),
            DataColumn(
              label: Flexible(
                child: Text(
                  overflow: TextOverflow.visible,
                  'Offer Amount',
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Status',
                ),
              ),
            ),
          ],
          rows: List.generate(
            2,
            (index) => DataRow(
              cells: [
                DataCell(
                  Text(
                    'Esther Howard',
                    style: context.twelve400,
                  ),
                ),
                DataCell(
                  Text(
                    '\$1,550,000',
                    style: context.twelve400,
                  ),
                ),
                DataCell(
                  Text(
                    'Active',
                    style: context.twelve400.withColor(context.primary500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
