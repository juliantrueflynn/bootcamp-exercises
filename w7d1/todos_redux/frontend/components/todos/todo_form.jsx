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
      title: event.target.title.value,
      body: event.target.body.value,
      done: false
    });

    event.target.title.value = "";
  }

  render() {
    return (
      <div>
        <h2>Add New Todo</h2>
        <form onSubmit={ this.handleSubmit }>
          <input type="text" name="title" placeholder="Title" /><br/>
          <textarea name="body" placeholder="Body"></textarea><br/>
          <input type="submit" value="Add" />
        </form>
      </div>
    );
  }
}

export default TodoForm;