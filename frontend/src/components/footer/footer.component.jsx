import React from 'react';
import './footer.styles.scss';
import FooterMenuItem from '../footer-menu-item/footer-menu-item.component';
const testData = [
  {
    name: 'Home',
    iconRoute:
      'https://github.com/Kimsy99/sponsor.me/blob/main/frontend%2Fsrc%2Fassets%2Fhome.svg',
  },
  {
    name: 'Account',
    iconRoute: '../../src/assets/account.svg',
  },
  {
    name: 'Projects',
    iconRoute: '../../src/assets/projects.svg',
  },
  {
    name: 'Help',
    iconRoute: '../../src/assets/Help.svg',
  },
];
const Footer = () => (
  <div className='footer'>
    <div className='footer-item-container'>
      <div className='menu-items'>
        <FooterMenuItem iconRoute={testData[0].iconRoute}>
          {testData[0].name}
        </FooterMenuItem>
      </div>
      <div className='description'></div>
    </div>
  </div>
);
export default Footer;
