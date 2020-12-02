import React from 'react';
import './footer-menu-item.styles.scss';
const FooterMenuItem = (props) => {
  console.log(props);
  return (
    <div className='menu-item'>
      <img src={props.iconRoute} /> {props.children}
    </div>
  );
};
export default FooterMenuItem;
