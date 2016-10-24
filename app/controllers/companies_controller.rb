class CompaniesController < ApplicationController
  def index
    if include_location?
      @companies = Company.where(city: city)
      render :city
    elsif include_sort?
      @companies = Company.order(:city)
      render :jobs_by_location
    else
      @companies = Company.all
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "#{@company.name} added!"
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
    @contact = Contact.new
    # redirect_to company_jobs_path(company)
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      flash[:success] = "#{@company.name} updated!"
      redirect_to company_path(@company)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.delete

    flash[:success] = "#{company.name} was successfully deleted!"
    redirect_to companies_path
  end


  private

  def company_params
    params.require(:company).permit(:name, :city)
  end

  def include_sort?
  true if params[:sort]
  end

  def city
    params[:location]
  end

  def include_location?
    true if params[:location]

  end
end
