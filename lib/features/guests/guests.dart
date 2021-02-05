import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weeding_planner/enums/groomsmens_side.dart';
import 'package:weeding_planner/features/guests/guests_form.dart';
import 'package:weeding_planner/features/guests/guests_list.dart';
import 'package:weeding_planner/models/guest.dart';
import 'package:weeding_planner/widgets/tab_scaffold.dart';

class Guests extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final guests = useState<List<Guest>>([]);

    addGuest(Guest newGuest) {
      guests.value = [...guests.value, newGuest];
    }

    deleteGuest(String id) {
      guests.value.removeWhere((guest) => guest.id == id);
      guests.value = List.from(guests.value);
    }

    openAddGuestFormModal(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return GuestsForm(addGuest);
          });
    }

    return TabScaffold(
      title: 'Convidados',
      callback: openAddGuestFormModal,
      tabs: [
        Tab(text: 'Da Noiva'),
        Tab(text: 'Do Noivo'),
        Tab(text: 'Todos'),
      ],
      tabsViews: [
        GuestsList(
          onDelete: deleteGuest,
          guests: guests.value
              .where((groomsmen) => groomsmen.side == GroomsmensSide.bride)
              .toList(),
        ),
        GuestsList(
          onDelete: deleteGuest,
          guests: guests.value
              .where((groomsmen) => groomsmen.side == GroomsmensSide.groom)
              .toList(),
        ),
        GuestsList(
          showSide: true,
          onDelete: deleteGuest,
          guests: guests.value,
        ),
      ],
    );
  }
}
