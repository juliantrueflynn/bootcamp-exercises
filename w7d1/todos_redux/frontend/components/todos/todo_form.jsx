import React from 'react';
import { uniqueId } from '../../util/util_todo';

class TodoForm extends React.Component {
  constructor(props) {
    super(props);

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();

    this.props.receiveTodo({
      id: uniqueId(),
      title: event.target.title.value
    });

    event.target.title.value = "";
  }

  render() {
    return (
      <div>
        <h2>Add New Todo</h2>
        <form onSubmit={ this.handleSubmit }>
          <input type="text" name="title" placeholder="Title" />
          <input type="submit" value="Add" />
        </form>
      </div>
    );
  }
}

export default TodoForm;