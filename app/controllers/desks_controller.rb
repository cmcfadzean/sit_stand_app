class DesksController < ApplicationController
  before_action :set_office
  before_action :set_desk, only: [:show, :edit, :update, :destroy]

  # GET offices/1/desks
  def index
    @desks = @office.desks
  end

  # GET offices/1/desks/1
  def show
  end

  # GET offices/1/desks/new
  def new
    @desk = @office.desks.build
  end

  # GET offices/1/desks/1/edit
  def edit
  end

  # POST offices/1/desks
  def create
    @desk = @office.desks.build(desk_params)

    if @desk.save
      redirect_to([@desk.office, @desk], notice: 'Desk was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT offices/1/desks/1
  def update
    if @desk.update_attributes(desk_params)
      redirect_to([@desk.office, @desk], notice: 'Desk was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE offices/1/desks/1
  def destroy
    @desk.destroy

    redirect_to office_desks_url(@office)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office
      @office = Office.find(params[:office_id])
    end

    def set_desk
      @desk = @office.desks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def desk_params
      params.require(:desk).permit(:name, :description, :price)
    end
end
