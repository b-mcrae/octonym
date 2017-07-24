class AcronymsController < ApplicationController
  http_basic_authenticate_with name: "octopus", password: "octosecret", except: [:index, :show]

  def index
    @acronyms = Acronym.all
  end

  def show
    @acronym = Acronym.find(params[:id])
  end

  def new
    @acronym = Acronym.new
  end

  def edit
    @acronym = Acronym.find(params[:id])
  end

  def create
    @acronym = Acronym.new(acronym_params)

    if @acronym.save
      redirect_to @acronym
    else
      render 'new'
    end
  end

  def update
    @acronym = Acronym.find(params[:id])

    if @acronym.update(acronym_params)
      redirect_to @acronym
    else
      render 'edit'
    end
  end

  def destroy
    @acronym = Acronym.find(params[:id])
    @acronym.destroy

    redirect_to acronyms_path
  end

  private
    def acronym_params
      params.require(:acronym).permit(:name, :definition, :description)
    end
end
