import React from 'react';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);

    this.handleDeleteClick = this.handleDeleteClick.bind(this);
    this.handleDoneStatusClick = this.handleDoneStatusClick.bind(this);
  }

  handleDeleteClick(event) {
    event.preventDefault();
    this.props.removeTodo(this.props.todo);
  }

  handleDoneStatusClick(event) {
    const newTodoDoneStatus = { done: ! this.props.todo.done };
    const todo = Object.assign(this.props.todo, newTodoDoneStatus);
    this.props.receiveTodo(todo);
  }

  render() {
    return (
      <li>
        {this.props.todo.title}
        <button onClick={this.handleDoneStatusClick}>
          {this.props.todo.done ? "Undo" : "Done" }
        </button>
        <button onClick={this.handleDeleteClick}>Delete</button>
      </li>
    );
  }
}

export default TodoListItem;