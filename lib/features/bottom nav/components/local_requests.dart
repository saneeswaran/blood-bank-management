import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/home%20page/service/blood_request_hive_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocalRequests extends StatefulWidget {
  final ScrollController controller;
  final VoidCallback? onNewRequestPressed;

  const LocalRequests({
    super.key,
    required this.controller,
    this.onNewRequestPressed,
  });

  @override
  State<LocalRequests> createState() => _LocalRequestsState();
}

class _LocalRequestsState extends State<LocalRequests> {
  final Map<String, bool> _requestClosedStatus = {};

  @override
  void initState() {
    super.initState();
    // Initialize closed status for all requests
    final requests = BloodRequestHiveManager.getAllRequests();
    for (var request in requests) {
      _requestClosedStatus[request.requestId ?? ''] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final requests = BloodRequestHiveManager.getAllRequests();
    final activeRequests = requests.where((r) => r.status == 'active').toList();
    final otherRequests = requests.where((r) => r.status != 'active').toList();

    return Scaffold(
      body: SingleChildScrollView(
        controller: widget.controller,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with summary
            _buildHeader(activeRequests.length),

            const SizedBox(height: 20),

            // Active requests section
            if (activeRequests.isNotEmpty) ...[
              const Text(
                'Active Requests',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please update the status of your previous requests before creating new ones:',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              ...activeRequests.map((request) => _buildRequestCard(request)),
              const SizedBox(height: 24),
            ],

            // Other requests section
            if (otherRequests.isNotEmpty) ...[
              const Text(
                'Previous Requests',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              ...otherRequests.map((request) => _buildRequestCard(request)),
              const SizedBox(height: 24),
            ],

            // New Request Button
            if (activeRequests.isNotEmpty) _buildNewRequestSection(),
          ],
        ),
      ),
      floatingActionButton: activeRequests.isEmpty
          ? FloatingActionButton.extended(
              onPressed: widget.onNewRequestPressed,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                'New Request',
                style: TextStyle(color: Colors.white),
              ),
            )
          : null,
    );
  }

  Widget _buildHeader(int activeCount) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Local Blood Requests',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: activeCount > 0
                        ? Colors.red.shade50
                        : Colors.green.shade50,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: activeCount > 0
                          ? Colors.red.shade100
                          : Colors.green.shade100,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        activeCount > 0 ? Icons.warning : Icons.check_circle,
                        size: 16,
                        color: activeCount > 0 ? Colors.red : Colors.green,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$activeCount Active',
                        style: TextStyle(
                          color: activeCount > 0 ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              activeCount > 0
                  ? 'You have $activeCount active request${activeCount > 1 ? 's' : ''} that need attention'
                  : 'All requests have been processed',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestCard(BloodRequest request) {
    final isActive = request.status == 'active';
    final isClosed = _requestClosedStatus[request.requestId ?? ''] ?? false;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isActive
              ? (isClosed ? Colors.grey : Colors.red.shade100)
              : Colors.grey.shade200,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Request header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Blood group badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getBloodGroupColor(request.bloodGroup),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    request.bloodGroup,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(request.status),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    request.status.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Patient/Hospital info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  request.patientName?.isNotEmpty == true
                      ? Icons.person
                      : Icons.local_hospital,
                  color: Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.patientName?.isNotEmpty == true
                            ? request.patientName!
                            : 'Anonymous Patient',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        request.hospitalName,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Details grid
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildDetailItem(
                        icon: Icons.bloodtype,
                        label: 'Units',
                        value:
                            '${request.units} unit${request.units > 1 ? 's' : ''}',
                      ),
                      _buildDetailItem(
                        icon: Icons.phone,
                        label: 'Contact',
                        value: request.contactPhone,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildDetailItem(
                        icon: Icons.priority_high,
                        label: 'Urgency',
                        value: request.urgency,
                        color: _getUrgencyColor(request.urgency),
                      ),
                      _buildDetailItem(
                        icon: Icons.calendar_today,
                        label: 'Created',
                        value: _formatDate(request.createdAt),
                      ),
                    ],
                  ),
                  if (request.location.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '${request.location['address'] ?? 'Location'}',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Action buttons for active requests
            if (isActive)
              Column(
                children: [
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Is this request already fulfilled/cancelled?',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Switch(
                        value: isClosed,
                        onChanged: (value) {
                          setState(() {
                            _requestClosedStatus[request.requestId ?? ''] =
                                value;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                  if (isClosed) ...[
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () =>
                                _updateRequestStatus(request, 'fulfilled'),
                            icon: const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            label: const Text(
                              'Mark as Fulfilled',
                              style: TextStyle(color: Colors.green),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.green),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () =>
                                _updateRequestStatus(request, 'cancelled'),
                            icon: const Icon(Icons.cancel, color: Colors.red),
                            label: const Text(
                              'Mark as Cancelled',
                              style: TextStyle(color: Colors.red),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required String value,
    Color? color,
  }) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, size: 16, color: color ?? Colors.grey),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 12,
                    color: color ?? Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewRequestSection() {
    return Card(
      elevation: 2,
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Icon(Icons.info_outline, size: 40, color: Colors.blue),
            const SizedBox(height: 12),
            const Text(
              'All active requests updated?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Please update the status of all active requests above before creating a new one.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Check if all active requests have been marked
                final activeRequests = BloodRequestHiveManager.getAllRequests()
                    .where((r) => r.status == 'active')
                    .toList();

                final allUpdated = activeRequests.every(
                  (request) =>
                      _requestClosedStatus[request.requestId ?? ''] == true,
                );

                if (allUpdated) {
                  widget.onNewRequestPressed?.call();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please update all active requests first'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Create New Blood Request'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateRequestStatus(BloodRequest request, String newStatus) {
    // Here you would update the request status in Hive
    // For now, just show a confirmation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Update'),
        content: Text('Mark this request as $newStatus?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Update in Hive
              // BloodRequestHiveManager.updateRequestStatus(request.requestId!, newStatus);

              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Request marked as $newStatus'),
                  backgroundColor: Colors.green,
                ),
              );

              // Refresh UI
              setState(() {});
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  Color _getBloodGroupColor(String bloodGroup) {
    const colors = {
      'A+': Colors.red,
      'A-': Colors.redAccent,
      'B+': Colors.blue,
      'B-': Colors.blueAccent,
      'AB+': Colors.purple,
      'AB-': Colors.purpleAccent,
      'O+': Colors.green,
      'O-': Colors.greenAccent,
    };
    return colors[bloodGroup] ?? Colors.grey;
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.orange;
      case 'fulfilled':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      case 'expired':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  Color _getUrgencyColor(String urgency) {
    switch (urgency.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return dateString;
    }
  }
}
