import React, { useEffect, useState } from 'react';
import './FarmerComponent.css'; // Ensure you have the appropriate CSS for styling
import { useNavigate } from 'react-router-dom';

const ViewProduct = () => {
  const [farmerProducts, setFarmerProducts] = useState([]);
  const userid=JSON.parse(localStorage.getItem("LoggedUser")).farmers[0].sid;
  const navigate= useNavigate()
  // Fetch all products when the component mounts
  useEffect(() => {
    const fetchFarmerProducts = async () => {
      try {
        const response = await fetch('http://localhost:8080/getProductBySid/'+userid);
        if (response.ok) {
          const data = await response.json();
          setFarmerProducts(data);
        } else {
          console.error('Failed to fetch farmer products');
        }
      } catch (error) {
        console.error('Error fetching farmer products:', error);
      }
    };

    fetchFarmerProducts();
  }, []);

  // Function to handle the removal of a product
  const handleRemoveProduct = async (producid) => {
    try {
      const response = await fetch(`http://localhost:8080/deleteProduct/`+producid, {
        method: 'DELETE',
      });

      if (response.ok) {
        // Remove the product from the state
        // setFarmerProducts(farmerProducts.filter(
        //   product => !(product.productId === productId && product.varietyId === varietyId)));
        console.log("deleted")
        navigate("/viewproduct")
      } else {
        console.error('Failed to delete the product');
      }
    } catch (error) {
      console.error('Error deleting the product:', error);
    }
  };

  return (
    <div className="view-product">
      <h2>Your Products</h2>
      {farmerProducts.length > 0 ? (
        <table>
          <thead>
            <tr>
              <th>Sr No</th>
              <th>Product Name</th>
              <th>Variety Name</th>
              <th>Stock</th>
              <th>Price</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            {farmerProducts.map((product, index) => (
              <tr key={index}>
                <td>{product.fpid}</td>
                <td>{product.product.pname}</td>
                <td>{product.variety.vname}</td>
                <td>{product.stock}</td>
                <td>${product.price}</td>
                <td>
                  <button onClick={() => handleRemoveProduct(product.fpid)}>
                    Remove
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      ) : (
        <p>No products added yet.</p>
      )}
    </div>
  );
};

export default ViewProduct;
