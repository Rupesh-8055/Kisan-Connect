import React, { useState, useEffect } from 'react';
import './BuyerComponent.css';
import { Link } from 'react-router-dom';

const BuyerComponent = () => {
  const [products, setProducts] = useState([]);
  const [cart, setCart] = useState(() => {
    const savedCart = localStorage.getItem('cart');
    return savedCart ? JSON.parse(savedCart) : [];
  });

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const response = await fetch('http://localhost:8080/getAllFarmerProduct');
        if (response.ok) {
          const data = await response.json();
          setProducts(data);
        } else {
          console.error('Failed to fetch products');
        }
      } catch (error) {
        console.error('Error fetching products:', error);
      }
    };

    fetchProducts();
  }, []);

  const toggleCart = (product) => {
    const isInCart = cart.some(item => item.productId === product.product.pid && item.varietyId === product.variety.vid);

    if (isInCart) {
      const updatedCart = cart.filter(item => !(item.productId === product.product.pid && item.varietyId === product.variety.vid));
      setCart(updatedCart);
      localStorage.setItem('cart', JSON.stringify(updatedCart));
    } else {
      const item = {
        productId: product.product.pid,
        productName: product.product.pname,
        varietyId: product.variety.vid,
        varietyName: product.variety.vname,
        price: product.price,
        farmerId:product.fpid,
        stock:product.stock,
      };

      const updatedCart = [...cart, item];
      setCart(updatedCart);
      localStorage.setItem('cart', JSON.stringify(updatedCart));
    }
  };

  const isInCart = (product) => {
    return cart.some(item => item.productId === product.product.pid && item.varietyId === product.variety.vid);
  };

  return (
    <div className="buyer-component container">
      <nav className="navbar navbar-expand-lg navbar-light bg-primary mb-4">
        <ul className="navbar-nav ml-auto">
          <li className="nav-item">
            <Link to="/view-cart" className="nav-link text-white">View Cart</Link>
          </li>
          <li className="nav-item">
            <Link to="/logout" className="nav-link text-white">Logout</Link>
          </li>
        </ul>
      </nav>

      <h1 className="mb-4">Welcome Buyer</h1>

      <div className="product-selection">
        <h2>Available Products</h2>
        <table className="table table-striped table-bordered">
          <thead className="thead-dark">
            <tr>
              <th>Product Name</th>
              <th>Variety</th>
              <th>Farmer</th>
              <th>Stock</th>
              <th>Price</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            {products.map((product) => (
              <tr key={product.fpid}>
                <td>{product.product.pname}</td>
                <td>{product.variety.vname}</td>
                <td>{product.farmer.fname} {product.farmer.lname}</td>
                <td>{product.stock}</td>
                <td>${product.price}</td>
                <td>
                  <button 
                    className={`btn ${isInCart(product) ? 'btn-danger' : 'btn-primary'}`}
                    onClick={() => toggleCart(product)}>
                    {isInCart(product) ? 'Remove from Cart' : 'Add to Cart'}
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default BuyerComponent;
