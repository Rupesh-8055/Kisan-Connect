import React from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import './HomeComponent.css';
import { useSelector } from 'react-redux';

const NavbarComp = () => {

   const mystate= useSelector((state)=>state.logged);    //initial state

    return (
        <div style={{display:mystate.loggedIn?"none":"block"}}>
        <nav className="navbar">
        <Link to="/" className="navbar-brand" style={{ fontWeight: 'bold', color: 'white' }}>
  Kisan-Connect
</Link>

                <ul className="navbar-menu">
                    <li className="navbar-item">
                        <Link to="/" className="navbar-link">Home</Link>
                    </li>
                    <li className="navbar-item">
                        <Link to="/login" className="navbar-link">Login</Link>
                    </li>
                    <li className="navbar-item">
                        <Link to="/registerbuyer" className="navbar-link">Buyer Registration</Link>
                    </li>
                    <li className="navbar-item">
                        <Link to="/registerfarmer" className="navbar-link">Farmer Registration</Link>
                    </li>
                    <li className="navbar-item">
                        <Link to="/aboutus" className="navbar-link">About Us</Link>
                    </li>
                </ul>
        </nav></div>
    );
};

export default NavbarComp;
