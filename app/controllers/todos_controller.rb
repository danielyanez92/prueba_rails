class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end
  def new
    @todo = Todo.new
  end
  def create
    todo = Todo.new(todo_params)
    todo.save
    if todo.save
      redirect_to root_path, notice: 'Se creo con exito el ToDo!'
    else
      redirect_to todos_new_path, notice: 'No se pudo crear el ToDo!'
    end

  end
  def show
    @todo = Todo.find(params[:id])
  end
  def edit
    @todo = Todo.find(params[:id])
  end
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to root_path, notice: 'Se ha actualizado con exito!'
    else
      redirect_to edit_todo_path(@todo), notice: 'No se ha podido actulizar!'
    end
  end
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path, notice: 'Se ha Destruido!'
  end
  def complete
    @todo = Todo.find(params[:id])
    @todo.completed = true
    @todo.save
    redirect_to root_path
  end
  def list
    @todos = Todo.all
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end
