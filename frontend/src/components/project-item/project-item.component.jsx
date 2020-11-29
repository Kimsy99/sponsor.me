import React from 'react';
import './project-item.styles.scss';
import BackProjectButton from '../back-project-button/back-project-button.component';

const ProjectItem = (props) => {
  const { name, targetFund, currentFund, imageUrl, produceBy } = props.data;
  return (
    <div className='project-item'>
      <div className='image' style={{ backgroundImage: `url(${imageUrl})` }} />
      <div className='project-footer'>
        <span className='name'>{name}</span>
        <span className='target-fund'>Target Fund: ${targetFund}</span>
        {/* <br />
        <span className='targetFund'>
          %: {(currentFund / targetFund) * 100}
        </span> */}
        <span>{(currentFund / targetFund) * 100}% funded</span>
        <span>By {produceBy}</span>
        <BackProjectButton
          type='submit'
          // className='custom-button'
          // onClick={() => addItem(item)}
          // inverted
        >
          Back Project
        </BackProjectButton>
      </div>
    </div>
  );
};
export default ProjectItem;
