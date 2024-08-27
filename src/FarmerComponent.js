import React from 'react';
import './FarmerComponent.css'; 
import { Link } from 'react-router-dom'; 

const FarmerComponent = () => {
  const user = JSON.parse(localStorage.getItem("LoggedUser"));
  console.log(user);

  return (
    <div className="farmer-component">
      <nav className="farmer-nav">
        <ul className="navbar-menu">
          <li className="navbar-item">
            <Link to="/add-products" className="navbar-link">Add Products</Link>
          </li>
          <li className="navbar-item">
            <Link to="/viewproduct" className="navbar-link">View Products</Link>
          </li>
          <li className="navbar-item">
            <Link to="/logout" className="navbar-link">Logout</Link>
          </li>
        </ul>
      </nav>
      <h1>Welcome, Farmer</h1>
    </div>
  );
};

export default FarmerComponent;
