class SubjectsController < ApplicationController
  layout 'application'
  before_action :set_subject, except: [:index, :new, :create]
  before_action :confirm_loggin
  before_action :count_subject
  # GET /subjects
  # GET /subjects.json
  def index
    @page_title = "Subjects"
    @subjects = Subject.sorted
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
        @page_title = "Show Subject"
  end

  # GET /subjects/new
  def new
    @page_title = "New Subject"
    @subject = Subject.new()
  end

  # GET /subjects/1/edit
  def edit
    @page_title = "Update Subject"
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_url, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update_attributes(subject_params)
        format.html { redirect_to subjects_path, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params[:subject].permit(:name, :body, :position)
    end

    
end
