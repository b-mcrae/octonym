class AcronymsController < ApplicationController
  def index
    @acronyms = Acronym.all
  end

  def show
    @acronym = Acronym.find(params[:id])
  end

  def new
  end

  def create
    @acronym = Acronym.new(acronym_params)

    @acronym.save
    redirect_to @acronym
  end

  private
    def acronym_params
      params.require(:acronym).permit(:name, :definition, :description)
    end
end
