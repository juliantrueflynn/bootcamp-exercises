import todosReducer from '../reducers/todos_reducer';
import { combineReducers } from 'redux';

const rootReducer = combineReducers({
  todosReducer
});

export default rootReducer;