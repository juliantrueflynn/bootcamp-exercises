import React from 'react';
import TodoListItem from './todo_list_item';

class TodoList extends React.Component {
  render() {
    console.log(this.props);
    const { todos, receiveTodo } = this.props;
    
    const todosList = todos.map(todo => (
      <TodoListItem key={todo.id} todo={todo} receiveTodo={receiveTodo} />
    ));

    return (
      <ul className="todos-ul">
        {todosList}
      </ul>
    );
  }
}

export default TodoList;