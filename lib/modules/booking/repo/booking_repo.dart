import 'package:evlve/api/api.dart';
import 'package:evlve/modules/booking/booking.dart';
import 'package:evlve/modules/user/user.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'booking_repo.g.dart';

@riverpod
BookingRepo bookingRepo(BookingRepoRef ref) {
  return BookingRepo(ref.watch(apiProvider), ref.watch(userProvider));
}

class BookingRepo {
  const BookingRepo(this._api, this._user);

  final ApiClient _api;
  final User _user;

  Future<BookingResponse> book({
    required String id,
    required DateTime dt,
  }) async {
    final res = await _api.post(
      ApiPath.bookClass,
      data: {
        'eventId': id,
        'eventDate': DateFormat('yyyy-MM-dd').format(dt),
        'memberId': _user.id,
        'action': 'book'
      },
    );
    return BookingResponse.fromJson(res.data as Map<String, dynamic>);
  }

  Future<BookingResponse> cancel({
    required String id,
    required DateTime dt,
  }) async {
    final res = await _api.post(
      ApiPath.bookClass,
      data: {
        'eventId': id,
        'eventDate': DateFormat('yyyy-MM-dd').format(dt),
        'memberId': _user.id,
        'action': 'cancel'
      },
    );

    return BookingResponse.fromJson(res.data as Map<String, dynamic>);
  }
}
