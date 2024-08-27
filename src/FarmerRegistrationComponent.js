import React, { useState } from 'react';
import './FarmerRegistrationComponent.css';

const FarmerRegistrationComponent = () => {
  const [formData, setFormData] = useState({
    fname: '',
    lname: '',
    email: '',
    regNo: '',
    contact: '',
    user: {
      email: '',
      password: '',
      rid: 2, // Hardcode
      uname: ''
    }
  });

  const [errors, setErrors] = useState({});

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prevState => {
      if (name.startsWith('user.')) {
        // Update 
        const userKey = name.split('.')[1];
        return {
          ...prevState,
          user: {
            ...prevState.user,
            [userKey]: value
          }
        };
      } else {
        return {
          ...prevState,
          [name]: value
        };
      }
    });
  };

  // Validate
  const validate = () => {
    const newErrors = {};
    if (!formData.fname.trim()) newErrors.fname = 'First Name is required';
    if (!formData.lname.trim()) newErrors.lname = 'Last Name is required';
    if (!formData.email) {
      newErrors.email = 'Email is required';
    } else if (!/\S+@\S+\.\S+/.test(formData.email)) {
      newErrors.email = 'Email address is invalid';
    }
    if (!formData.regNo.trim()) newErrors.regNo = 'Registration Number is required';
    if (!formData.contact.trim()) {
      newErrors.contact = 'Contact Number is required';
    } else if (!/^\d{10}$/.test(formData.contact)) {
      newErrors.contact = 'Contact Number must be 10 digits';
    }
    if (!formData.user.email) {
      newErrors.userEmail = 'User Email is required';
    } else if (!/\S+@\S+\.\S+/.test(formData.user.email)) {
      newErrors.userEmail = 'User Email address is invalid';
    }
    if (!formData.user.password.trim()) newErrors.userPassword = 'Password is required';
    if (!formData.user.uname.trim()) newErrors.userUname = 'Username is required';
    return newErrors;
  };

  // submission
  const handleSubmit = async (e) => {
    e.preventDefault();
    const validationErrors = validate();
    if (Object.keys(validationErrors).length > 0) {
      setErrors(validationErrors);
    } else {
      try {
        const response = await fetch('https://localhost:7046/api/UserManagement/SaveFarmer', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify(formData)
        });

        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        console.log('Form data submitted successfully:', data);
        // Handle success
      } catch (error) {
        console.error('Error submitting form data:', error);
        // Handle error
      }
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <h2>Farmer Registration</h2>

      <label>
        First Name:
        <input
          type="text"
          name="fname"
          value={formData.fname}
          onChange={handleChange}
          required
        />
        {errors.fname && <span className="error">{errors.fname}</span>}
      </label>

      <label>
        Last Name:
        <input
          type="text"
          name="lname"
          value={formData.lname}
          onChange={handleChange}
          required
        />
        {errors.lname && <span className="error">{errors.lname}</span>}
      </label>

      <label>
        Email:
        <input
          type="email"
          name="email"
          value={formData.email}
          onChange={handleChange}
          required
        />
        {errors.email && <span className="error">{errors.email}</span>}
      </label>

      <label>
        Registration Number:
        <input
          type="text"
          name="regNo"
          value={formData.regNo}
          onChange={handleChange}
          required
        />
        {errors.regNo && <span className="error">{errors.regNo}</span>}
      </label>

      <label>
        Contact Number:
        <input
          type="text"
          name="contact"
          value={formData.contact}
          onChange={handleChange}
          required
        />
        {errors.contact && <span className="error">{errors.contact}</span>}
      </label>

      <h3>User Information</h3>

      <label>
        User Email:
        <input
          type="email"
          name="user.email"
          value={formData.user.email}
          onChange={handleChange}
          required
        />
        {errors.userEmail && <span className="error">{errors.userEmail}</span>}
      </label>

      <label>
        Password:
        <input
          type="password"
          name="user.password"
          value={formData.user.password}
          onChange={handleChange}
          required
        />
        {errors.userPassword && <span className="error">{errors.userPassword}</span>}
      </label>

      <label>
        Username:
        <input
          type="text"
          name="user.uname"
          value={formData.user.uname}
          onChange={handleChange}
          required
        />
        {errors.userUname && <span className="error">{errors.userUname}</span>}
      </label>

      <button type="submit">Register</button>
    </form>
  );
};

export default FarmerRegistrationComponent;


