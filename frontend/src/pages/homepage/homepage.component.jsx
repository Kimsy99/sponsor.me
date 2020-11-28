import React from 'react';
import './homepage.styles.scss';
import introImage from '../../assets/homepage-intro-illustration.png';
import ProjectItem from '../../components/project-item/project-item.component';

//temp data
const testData = [
  {
    id: 1,
    imageUrl: 'https://i.imgur.com/zm10H4x.jpg',
    name: 'Robo Cleaner A9234234: Smart Robot Cleaner with auto sensing dust',
    description:
      'Robo Cleaner A9234234: Smart Robot Cleaner with auto sensing dust',
    targetFund: 123,
    currentFund: 12,
    produceBy: 'Kim Sheng Yong',
  },
];

const HomePage = () => (
  <div className='home-page'>
    <div className='intro-section'>
      <img className='intro-image' src={introImage} alt='intro-image' />
      <div className='intro-text'>
        <h1>Sponsor.me</h1>
        <br />
        <p>
          We are a crowdfunding platform for University Students focus on
          creativity. Student may start any creative project here to start to
          get fundings
        </p>
      </div>
    </div>
    <ProjectItem key={testData[0].id} data={testData[0]} />
  </div>
);
export default HomePage;
