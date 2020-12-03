import React from 'react';
import './footer-menu-item.styles.scss';

class FooterMenuItem extends React.Component {
  render() {
    console.log(this.props);
    // const { icon } = this.props;
    return (
      <div className='menu-item'>
        <img className='icon' src={this.props.icon} />
        <span>{this.props.children}</span>
      </div>
    );
  }
}
export default FooterMenuItem;
