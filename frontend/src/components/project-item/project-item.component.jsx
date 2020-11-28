import React from 'react';
import './project-item.styles.scss';

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
        <span
        // className='custom-button'
        // onClick={() => addItem(item)}
        // inverted
        >
          Back Project
        </span>
      </div>
    </div>
  );
};
export default ProjectItem;
