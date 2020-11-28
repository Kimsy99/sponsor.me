import React from 'react';
import { Link } from 'react-router-dom';
import { ReactComponent as Logo } from '../../logo.svg';
import './header.styles.scss';
const Header = () => (
  <div className='header'>
    <Link to='/' className='logo-container'>
      <Logo className='logo' />
    </Link>
    <div className='options'>
      <Link className='option' to='/projects'>
        Explore
      </Link>
      {/* {currentUser ? (
        <div className='option'>Sign Out</div>
      ) : ( */}
      <Link className='option' to='/signin'>
        Sign in
      </Link>
      {/* )} */}
      {/* <CartIcon /> */}
    </div>
    {/* {hidden ? null : <CartDropdown />} */}
  </div>
);
export default Header;
