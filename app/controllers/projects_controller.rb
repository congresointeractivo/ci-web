class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all(:order => 'Project.initiated DESC').paginate :page => params[:page], :per_page => PER_PAGE  

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])
    @afirmative_vote_count = @project.votes.where(:voteType => 'AFIRMATIVE').count
    @negative_vote_count = @project.votes.where(:voteType => 'NEGATIVE').count
    @absent_vote_count = @project.votes.where(:voteType => 'ABSENT').count
    @abstention_vote_count = @project.votes.where(:voteType => 'ABSTENTION').count
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end
end
