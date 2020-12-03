import React from 'react';
import './footer.styles.scss';
import FooterMenuItem from '../footer-menu-item/footer-menu-item.component';
import HomeSvg from '../../assets/Home.svg';
import HelpSvg from '../../assets/Help.svg';
import ProjectSvg from '../../assets/Projects.svg';
import AccountSvg from '../../assets/Account.svg';

const testData = [
  {
    name: 'Home',
    icon: HomeSvg,
  },
  {
    name: 'Account',
    icon: AccountSvg,
  },
  {
    name: 'Projects',
    icon: ProjectSvg,
  },
  {
    name: 'Help',
    icon: HelpSvg,
  },
];
const Footer = () => (
  <div className='footer'>
    <div className='footer-item-container'>
      <div className='menu-items'>
        {testData.map((data) => {
          return <FooterMenuItem icon={data.icon}>{data.name}</FooterMenuItem>;
        })}
      </div>
      <div className='description'>
        <p>Created by Kenneth Tan, Kim Sheng Yong, Chua Tuan Hong</p>
        <p className='copyright'>Sponsor.me © 2020</p>
        <p className='tnc'>Terms of Service - Privacy Policy</p>
      </div>
    </div>
  </div>
);
export default Footer;
