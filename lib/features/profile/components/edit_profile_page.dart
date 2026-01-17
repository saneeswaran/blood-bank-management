import 'dart:developer';

import 'package:blood_bank/features/search/model/user_model.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel userProfile;
  const EditProfilePage({super.key, required this.userProfile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _bloodGroupController;
  late TextEditingController _ageController;
  late TextEditingController _weightController;
  late TextEditingController _lastDonationController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;

  String? _selectedBloodGroup;
  bool _isAvailableForDonation = true;
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userProfile.name);
    _emailController = TextEditingController(text: widget.userProfile.email);
    _phoneController = TextEditingController(
      text: widget.userProfile.phone.toString(),
    );
    _bloodGroupController = TextEditingController(
      text: widget.userProfile.bloodGroup,
    );
    _ageController = TextEditingController(
      text: widget.userProfile.age?.toString() ?? '',
    );
    _weightController = TextEditingController(
      text: widget.userProfile.weight?.toString() ?? '',
    );
    _lastDonationController = TextEditingController(
      text: widget.userProfile.lastDonationDate,
    );
    _addressController = TextEditingController(
      text: widget.userProfile.location['fullAddress'],
    );
    _cityController = TextEditingController(
      text: widget.userProfile.location['city'],
    );

    _selectedBloodGroup = widget.userProfile.bloodGroup;
    _isAvailableForDonation = widget.userProfile.isAvailable;
    _selectedGender = widget.userProfile.gender;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bloodGroupController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _lastDonationController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: _saveProfile),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture Section
              _buildProfilePictureSection(),
              const SizedBox(height: 24),

              // Personal Information Section
              _buildSectionTitle('Personal Information'),
              const SizedBox(height: 16),

              // Name Field
              _buildTextField(
                controller: _nameController,
                label: 'Full Name',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Email Field
              _buildTextField(
                controller: _emailController,
                label: 'Email Address',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Phone Field
              _buildTextField(
                controller: _phoneController,
                label: 'Phone Number',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length < 10) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Gender Selection
              _buildGenderSelection(),
              const SizedBox(height: 24),

              // Medical Information Section
              _buildSectionTitle('Medical Information'),
              const SizedBox(height: 16),

              Row(
                children: [
                  // Blood Group Dropdown
                  Expanded(child: _buildBloodGroupDropdown()),
                  const SizedBox(width: 12),

                  // Age Field
                  Expanded(
                    child: _buildTextField(
                      controller: _ageController,
                      label: 'Age',
                      icon: Icons.calendar_today,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your age';
                        }
                        final age = int.tryParse(value);
                        if (age == null || age < 18 || age > 65) {
                          return 'Age must be between 18-65';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  // Weight Field
                  Expanded(
                    child: _buildTextField(
                      controller: _weightController,
                      label: 'Weight (kg)',
                      icon: Icons.monitor_weight,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your weight';
                        }
                        final weight = double.tryParse(value);
                        if (weight == null || weight < 45) {
                          return 'Minimum weight is 45kg';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Last Donation Field
                  Expanded(
                    child: _buildTextField(
                      controller: _lastDonationController,
                      label: 'Last Donation',
                      icon: Icons.calendar_month,
                      hintText: 'DD/MM/YYYY',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Location Information Section
              _buildSectionTitle('Location Information'),
              const SizedBox(height: 16),

              // Address Field
              _buildTextField(
                controller: _addressController,
                label: 'Address',
                icon: Icons.location_on,
                maxLines: 2,
              ),
              const SizedBox(height: 12),

              // City Field
              _buildTextField(
                controller: _cityController,
                label: 'City',
                icon: Icons.location_city,
              ),
              const SizedBox(height: 24),

              // Availability Toggle
              _buildAvailabilityToggle(),
              const SizedBox(height: 32),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePictureSection() {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[300]!, width: 3),
                ),
                child: ClipOval(
                  child: widget.userProfile.image != null
                      ? Image.network(
                          widget.userProfile.image!,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: _changeProfilePicture,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: _changeProfilePicture,
            child: const Text(
              'Change Profile Picture',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    String? hintText,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildGenderOption(
                value: 'male',
                label: 'Male',
                icon: Icons.male,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildGenderOption(
                value: 'female',
                label: 'Female',
                icon: Icons.female,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildGenderOption(
                value: 'other',
                label: 'Other',
                icon: Icons.transgender,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderOption({
    required String value,
    required String label,
    required IconData icon,
  }) {
    final isSelected = _selectedGender == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red.withOpacity(0.1) : Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.red : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.red : Colors.grey[600],
              size: 20,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.red : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodGroupDropdown() {
    final bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Blood Group',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedBloodGroup,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
              items: bloodGroups.map((String group) {
                return DropdownMenuItem<String>(
                  value: group,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          group,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(group),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBloodGroup = newValue;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvailabilityToggle() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available for Donation',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Toggle to mark your availability status',
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            ],
          ),
          Switch(
            value: _isAvailableForDonation,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _isAvailableForDonation = value;
              });
            },
          ),
        ],
      ),
    );
  }

  void _changeProfilePicture() {
    // Implement image picker logic here
    log('Change profile picture');
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Save profile logic here

      // Navigate back or show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}

// User Profile Model
