import React, { useState, useEffect } from 'react';
import './FarmerComponent.css'; 

const AddProduct = () => {
  const [products, setProducts] = useState([]);
  const [selectedProductId, setSelectedProductId] = useState('');
  const [varieties, setVarieties] = useState([]);
  const [selectedVarietyId, setSelectedVarietyId] = useState('');
  const [stock, setStock] = useState('');
  const [price, setPrice] = useState('');
  const [farmerProducts, setFarmerProducts] = useState([]);
  const userid=JSON.parse(localStorage.getItem("LoggedUser")).farmers[0].sid;
  useEffect(() => {
    fetch('http://localhost:8080/getAllProduct')
      .then(response => {
        if (response.ok) {
          return response.json();
        } else {
          console.error('Failed to fetch products');
        }
      })
      .then(data => {
        console.log("Fetched products:", data); // Debugging line
        setProducts(data);
      })
      .catch(error => console.error('Error fetching products:', error));
  }, []);

  // Fetch varieties
  const handleProductSelect = (e) => {
    const selectedId = e.target.value;
    setSelectedProductId(selectedId);

    console.log("Selected Product ID:", selectedId); // Debugging

    //fetch(`/api/products/${selectedId}/varieties`)
    fetch("http://localhost:8080/getAllVariety/"+selectedId)
      .then(response => {
        if (response.ok) {
          return response.json();
        } else {
          console.error('Failed to fetch varieties');
        }
      })
      .then(data => {
        console.log("Varieties fetched:", data); // Debugging 
        setVarieties(data);
        setSelectedVarietyId(''); 
      })
      .catch(error => console.error('Error fetching varieties:', error));
  };

  const handleVarietySelect = (e) => {
    const selectedId = e.target.value;
    setSelectedVarietyId(selectedId);
  };

  const handleAddProduct = (e) => {
    e.preventDefault();

    if (selectedProductId && selectedVarietyId && stock && price) {
      const selectedProduct = products.find(product => product.pid === selectedProductId);
      const selectedVariety = varieties.find(variety => variety.vid === selectedVarietyId);

      const newProduct = {
        productId: selectedProductId,
        productName: selectedProduct.pname,
        varietyId: selectedVarietyId,
        varietyName: selectedVariety.vname,
        stock,
        price,
      };

      setFarmerProducts([...farmerProducts, newProduct]);

      // Reset
      setSelectedProductId('');
      setVarieties([]);
      setSelectedVarietyId('');
      setStock('');
      setPrice('');
    } else {
      alert('Please fill out all fields before adding the product.');
    }
  };

  const handlesubmit = () => {
    const DataTransfer = {
      sid: userid,
      pid: selectedProductId,
      stock: stock,
      vid: selectedVarietyId,
      price: price
    };

    const reqdata = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(DataTransfer)
    };

    //API call
    fetch("http://localhost:8080/addProduct", reqdata)
      .then(response => {
        if (response.ok) {
          return response.json();
        } else {
          console.error('Failed to add product');
        }
      })
      .then(data => console.log(data))
      .catch(error => console.error('Error:', error));
  };

  return (
    <div className="add-product">
      <h2>Add Product</h2>
      <form >
        <label>
          Select Product:
          <select value={selectedProductId} onChange={handleProductSelect}>
            <option value="">--Select a Product--</option>
            {products.map(product => (
              <option key={product.pid} value={product.pid}>
                {product.pname}
              </option>
            ))}
          </select>
        </label>

        {varieties.length > 0 && (
          <label>
            Select Variety:
            <select value={selectedVarietyId} onChange={handleVarietySelect}>
              <option value="">--Select a Variety--</option>
              {varieties.map(variety => (
                <option key={variety.vid} value={variety.vid}>
                  {variety.vname}
                </option>
              ))}
            </select>
          </label>
        )}

        <label>
          Available Stock:
          <input
            type="number"
            value={stock}
            onChange={(e) => setStock(e.target.value)}
            placeholder="Enter stock"
            required
          />
        </label>

        <label>
          Price:
          <input
            type="number"
            value={price}
            onChange={(e) => setPrice(e.target.value)}
            placeholder="Enter price"
            required
          />
        </label>

        <button type="submit" onClick={handlesubmit}>Add Product</button>
      </form>

      <h3>Your Products</h3>
      <ul>
        {farmerProducts.map((product, index) => (
          <li key={index}>
            Product: {product.productName}, Variety: {product.varietyName}, Stock: {product.stock}, Price: {product.price}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default AddProduct;
