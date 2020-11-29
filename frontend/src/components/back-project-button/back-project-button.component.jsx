import React from 'react';

const BackProjectButton = ({ children, ...otherProps }) => (
  <button className='custom-button' {...otherProps}>
    {children}
  </button>
);
export default BackProjectButton;
