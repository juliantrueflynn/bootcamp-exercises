import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
import rootReducer from '../reducers/root_reducer';
import thunkMiddleware from '../middleware/thunk';

const configureStore = () => (
  createStore(
    rootReducer,
    applyMiddleware(thunkMiddleware, logger)
  )
);

export default configureStore;