import React, { useState, useEffect } from 'react';
import './ViewCart.css';
import { Link } from 'react-router-dom';

const ViewCart = ({ setCart }) => {
  const [cart, setCartState] = useState([]);
  const [totalAmount, setTotalAmount] = useState(0);
  const buyer= JSON.parse(localStorage.getItem("LoggedUser")).buyers[0].bid;
  console.log(cart)
  useEffect(() => {
    const savedCart = JSON.parse(localStorage.getItem('cart'));
    if (savedCart) {
      setCartState(savedCart);
      calculateTotal(savedCart);
    }
  }, []);

  const calculateTotal = (cart) => {
    const total = cart.reduce((sum, grain) => sum + grain.price, 0);
    setTotalAmount(total);
  };

  const removeFromCart = (grainToRemove) => {
    const updatedCart = cart.filter((grain) => grain.productId !== grainToRemove.productId || grain.varietyId !== grainToRemove.varietyId);
    setCartState(updatedCart);
    localStorage.setItem('cart', JSON.stringify(updatedCart));
    calculateTotal(updatedCart);
  };

  const placeOrder = async () => {
    if (cart.length === 0) {
      alert('Your cart is empty. Add some products before placing an order.');
      return;
    }

    // Extract 
    const orderDetails = cart.map((grain) => ({
      qty: grain.stock, 
      pid: grain.productId,
      price: grain.price,
    }));
    const buyerId = buyer; 
    const date = new Date().toISOString().split('T')[0]; // Format YYYY-MM-DD

    const orderData = {
      date,
      tamt: totalAmount,
      bid: buyerId,
      pid: 9, //check this
      orderDetails,
    };

    try {
      const response = await fetch('http://localhost:8080/placeOrder', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(orderData),
      });

      if (!response.ok) {
        throw new Error('Network response was not ok');
      }

      const result = await response.json();

      alert('Order placed successfully!');
      removeProduct()
      setCartState([]);
      localStorage.removeItem('cart');
      setTotalAmount(0);
    } catch (error) {
      console.error('Error placing order:', error);
      alert('Failed to place the order. Please try again.');
    }
  };

  const removeProduct = async () => {
    try {
      await Promise.all(
        cart.map(async (grain) => {
          const response = await fetch(`http://localhost:8080/deleteProduct/${grain.farmerId}`, {
            method: 'DELETE',
            headers: { 'Content-Type': 'application/json' },
          });
  
          if (!response.ok) {
            throw new Error(`Failed to delete product with ID ${grain.farmerId}`);
          }
        })
      );
    } catch (error) {
      console.error('Error removing products:', error);
      alert('Failed to remove products. Please try again.');
    }
  };
  

  return (
    <div className="container view-cart-component">
      <nav className="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <ul className="navbar-nav mr-auto">
          <li className="nav-item">
            <Link to="/buyerpage" className="nav-link">Continue Shopping</Link>
          </li>
          <li className="nav-item">
            <Link to="/logout" className="nav-link">Logout</Link>
          </li>
        </ul>
      </nav>

      <h1 className="mb-4">Your Cart</h1>

      {cart.length === 0 ? (
        <div className="alert alert-info">Your cart is empty.</div>
      ) : (
        <div className="cart-items row">
          {cart.map((grain) => (
            <div key={`${grain.productId}-${grain.varietyId}`} className="col-md-4 mb-4">
              <div className="card">
                <div className="card-body">
                  <h5 className="card-title">{grain.productName} - {grain.varietyName}</h5>
                  <p className="card-text">Price: ${grain.price}</p>
                  <button onClick={() => removeFromCart(grain)} className="btn btn-danger">
                    Remove from Cart
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}

      <div className="cart-summary mt-4">
        <h4>Total Amount: ${totalAmount.toFixed(2)}</h4>
        <button onClick={placeOrder} className="btn btn-success btn-lg mt-3">
          Place Order
        </button>
      </div>
    </div>
  );
};

export default ViewCart;
