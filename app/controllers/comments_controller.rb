class CommentsController < ApplicationController
    before_filter :load_suggestion
    # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = @suggestion.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = @suggestion.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = @suggestion.comments.find(params[:id])
  end

  # suggestion /comments
  # suggestion /comments.xml
  def create
    @comment = @suggestion.comments.build(params[:comment])
    @comment.user_name = current_user.login

    respond_to do |format|
      if @comment.save
        flash[:notice] = '<img src="/images/comment_submitted.jpg">'
        format.html { redirect_to([@suggestion]) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { redirect_to([@suggestion]) }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = @suggestion.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to([@suggestion]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = @suggestion.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(suggestion_comments_url) }
      format.xml  { head :ok }
    end
  end

  def load_suggestion
      @suggestion = Suggestion.find(params[:suggestion_id])
    end
end
