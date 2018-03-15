import React from 'react';
import StepListItemContainers from './step_list_item_container';
import StepForm from './step_form';

class StepList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h2>Step list here</h2>
        <StepListItemContainers />
        <StepForm />
      </div>
    );
  }
}

export default StepList;