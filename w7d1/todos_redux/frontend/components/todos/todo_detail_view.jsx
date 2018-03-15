import React from 'react';
import StepListContainer from '../../components/step_list/step_list_container';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);

    this.handleDeleteParentClick = this.handleDeleteParentClick.bind(this);
  }

  handleDeleteParentClick(event) {
    event.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  render() {
    return (
      <div>
        <StepListContainer />
        <button onClick={this.handleDeleteParentClick}>Delete</button>
      </div>
    );
  }
}

export default TodoDetailView;