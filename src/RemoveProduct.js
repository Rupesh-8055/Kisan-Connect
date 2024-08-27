import React, { useState } from 'react';
import './FarmerComponent.css';

const RemoveProduct = () => {
  const [productId, setProductId] = useState('');

  const handleRemoveProduct = async () => {
  
    try {
        const response = await fetch(`/api/products/${productId}`, {
          method: 'DELETE',
        });

      if (response.ok) {
        alert('Product removed successfully!');
      } else {
        alert('Failed to remove product.');
      }
    } catch (error) {
      console.error('Error removing product:', error);
    }
  };

  return (
    <div className="remove-product">
      <h2>Remove Product</h2>
      <form>
        <label>
          Product ID:
          <input
            type="text"
            value={productId}
            onChange={(e) => setProductId(e.target.value)}
          />
        </label>
        <button type="button" onClick={handleRemoveProduct}>Remove Product</button>
      </form>
    </div>
  );
};

export default RemoveProduct;