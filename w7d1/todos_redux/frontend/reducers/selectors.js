export const allTodos = ({ todos }) => Object.keys(todos).map(id => todos[id]);

export const stepsByTodoId = ({ steps }, todoId) => {
  const todoSteps = [];
  Object.keys(steps).forEach((stepId) => {
    const step = steps[stepId];
    if (steps[stepId].todoId === todoId) stepsByTodoId.push(step);
  });

  return todoSteps;
};
