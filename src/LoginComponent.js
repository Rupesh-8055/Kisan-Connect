
import React, { useState } from 'react';
import { Form, Button, Alert } from 'react-bootstrap';
import axios from 'axios';
import { useNavigate } from 'react-router-dom'; // Import the useNavigate hook
import './LoginComponent.css';
import { login } from './Slice';
import { useDispatch } from 'react-redux';

const LoginComponent = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [success, setSuccess] = useState('');
  const navigate = useNavigate(); // Initialize the navigate hook
  const reduxAction= useDispatch();  //redux

  const validateForm = () => {
    if (!username || !password) {
      setError('Both fields are required');
      return false;
    }
    return true;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError('');
    setSuccess('');

    if (!validateForm()) {
      return;
    }

    try {
      const response = await axios.post('https://localhost:7046/api/UserManagement/UpdateVerifyLogin', { 
        uname: username,
        password: password 
      });

      const  Rid  = response.data.rid; 
      console.log(Rid);
      setSuccess('Login successful ✅');

      reduxAction(login())
      localStorage.setItem("LoggedUser",JSON.stringify(response.data))
      // Navigate based on Rid
      if (Rid === 2) {
        navigate('/farmerpage');
      } else if (Rid === 3) {
        navigate('/buyerpage');
      } else {
        setError('Unknown role. Please contact support.');
      }

    } catch (error) {
      setError('Login failed ❌. Please try again.');
      console.error('Error:', error);
    }
  };


  const handleCancel = () => {
    setUsername('');
    setPassword('');
    setError('');
    setSuccess('');
  };

  return (
    <div className="login-component">
      <h2>Login</h2>
      {error && <Alert variant="danger">{error}</Alert>}
      {success && <Alert variant="success">{success}</Alert>}
      <Form onSubmit={handleSubmit}>
        <Form.Group controlId="formBasicUsername">
          <Form.Label>Username</Form.Label>
          <Form.Control
            type="text"
            placeholder="Enter username"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </Form.Group>

        <Form.Group controlId="formBasicPassword">
          <Form.Label>Password</Form.Label>
          <Form.Control
            type="password"
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </Form.Group>

        <Button variant="primary" type="submit">
          Submit
        </Button>
        <Button variant="secondary" type="button" onClick={handleCancel} className="ml-2">
          Cancel
        </Button>
      </Form>
    </div>
  );
};

export default LoginComponent;



