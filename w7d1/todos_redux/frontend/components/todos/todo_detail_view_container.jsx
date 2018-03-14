import { connect } from 'react-redux';
import { removeTodo } from '../../actions/todo_actions';
import {
  receiveSteps,
  receiveStep,
  removeStep
} from '../../actions/step_actions';
import { stepsByTodoId } from '../../reducers/selectors';
import TodoDetailView from './todo_detail_view';

const mapDispatchToProps = (dispatch, { todo }) => ({
  removeTodo: () => dispatch(removeTodo(todo)),
  receiveSteps: steps => dispatch(receiveSteps(steps))
});

export default connect(null, mapDispatchToProps)(TodoDetailView);
