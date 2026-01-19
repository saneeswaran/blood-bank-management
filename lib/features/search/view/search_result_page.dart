import 'package:blood_bank/features/search/view%20model/search_donor_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultPage extends ConsumerStatefulWidget {
  final String bloodGroup;
  final Map<String, dynamic> location;
  const SearchResultPage({
    super.key,
    required this.bloodGroup,
    required this.location,
  });

  @override
  ConsumerState<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends ConsumerState<SearchResultPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(searchDonorNotifier.notifier)
          .fetchDonors(
            bloodGroup: widget.bloodGroup,
            location: widget.location,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchDonorNotifier);
    return Scaffold(
      appBar: AppBar(title: const Text("Search Results")),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.donors.isEmpty
          ? const Center(child: Text("No donors found"))
          : ListView.builder(
              itemCount: state.donors.length,
              itemBuilder: (context, index) {
                final donor = state.donors[index];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(donor.name),
                    subtitle: Text("${donor.bloodGroup} • ${donor.phone}"),
                  ),
                );
              },
            ),
    );
  }
}
