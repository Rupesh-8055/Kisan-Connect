import React, { useState } from 'react';
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import LoginComponent from './LoginComponent';
import NavbarComp from './HomeComponent';
import './HomeComponent.css'; // Import the CSS file for styling
import FarmerComponent from './FarmerComponent';
import BuyerRegistrationComponent from './BuyerRegistrationComponent';
import AboutUsComponent from './AboutUsComponent.js';
import BuyerComponent from './BuyerComponent';   
import FarmerRegistrationComponent from './FarmerRegistrationComponent';
import LogoutComp from './LogoutComp';    
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import AddProduct from './AddProduct';
import RemoveProduct from './RemoveProduct';
import ViewProduct from './ViewProduct';
import ViewCart from './ViewCart.js'; 


function App() {
  // State
  const [cart, setCart] = useState([]);

  return (
    <div className="App">
      <Routes>
        <Route path="/" element={<NavbarComp />} />
        <Route path="/login" element={<LoginComponent />} />
        <Route path="/registerfarmer" element={<FarmerRegistrationComponent />} />
        <Route path="/registerbuyer" element={<BuyerRegistrationComponent />} />
        <Route path="/aboutus" element={<AboutUsComponent />} />
        <Route path="/buyerpage" element={<BuyerComponent cart={cart} setCart={setCart} />} /> {/* Pass cart and setCart */}
        <Route path="/farmerpage" element={<FarmerComponent />} />
        <Route path="/logout" element={<LogoutComp />} />
        <Route path="/viewproduct" element={<ViewProduct />}/>

      
        <Route path="/add-products" element={<AddProduct />} />
        {/* <Route path="/remove-products" element={<RemoveProduct />} /> */}
        <Route path="/viewproduct" element={<ViewProduct />} />
        <Route path="/view-cart" element={<ViewCart cart={cart} setCart={setCart} />} /> {/* Pass cart and setCart */}
      </Routes>
    </div>
  );
}

export default App;