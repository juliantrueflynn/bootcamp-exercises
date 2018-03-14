import React from 'react';
import TodoDetailViewContainer from './todo_detail_view_container';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);

    this.state = { detail: false };
    this.handleDoneStatusClick = this.handleDoneStatusClick.bind(this);
    this.handleDetailClick = this.handleDetailClick.bind(this);
  }

  handleDoneStatusClick(event) {
    const newTodoDoneStatus = { done: ! this.props.todo.done };
    const todo = Object.assign(this.props.todo, newTodoDoneStatus);
    this.props.receiveTodo(todo);
  }

  handleDetailClick(event) {
    this.setState({ detail: ! this.state.detail });
  }

  render() {
    const { todo } = this.props;
    const { title, done } = todo;

    let detail;
    if (this.state.detail) {
      detail = <TodoDetailViewContainer todo={todo} />;
    }

    return (
      <li>
        <span onClick={this.handleDetailClick}>{title}</span>
        <button onClick={this.handleDoneStatusClick}>
          {done ? "Undo" : "Done"}
        </button>
        {detail}
      </li>
    );
  }
}

export default TodoListItem;